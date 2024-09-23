@implementation PKPhysicsBody

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<PKPath>)outline
{
  PKPath **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<PKPath> result;

  cntrl = self->_outline.__cntrl_;
  *v2 = self->_outline.__ptr_;
  v2[1] = (PKPath *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKPath *)self;
  return result;
}

- (void)setOutline:(shared_ptr<PKPath>)a3
{
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&self->_outline.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void)volume
{
  PKPhysicsShape **begin;
  PKPhysicsShape *v4;
  int v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  b2Body *v12;
  float32x2_t v13;
  float32x2_t v14;
  __int128 v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unint64_t v20;
  float *v21;
  float *v22;
  float *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  float *v29;
  float *v30;
  uint64_t v31;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  b2Body *v38;
  float32x2_t var1;
  float32x2_t v40;
  __int128 v41;
  float v42;
  float v43;
  float v44;
  float v45;
  unint64_t v46;
  float *v47;
  float *v48;
  float *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  float *v55;
  float *v56;
  uint64_t v57;
  void **v58;
  _QWORD *v59;
  float *v60;
  float v61;
  float v62;
  float v63;
  float v64;
  b2Body *v65;
  float v66;
  float var0;
  float v68;
  float v69;
  float v70;
  float *v71;
  int v72;
  float v73;
  float v74;
  float v75;
  __float2 v76;
  float v77;
  float v78;
  float *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  float *v85;
  float *v86;
  uint64_t v87;
  __int128 v88;
  void *__p;
  void *v90;
  uint64_t v91;

  begin = self->_shapes.__begin_;
  if ((PKPhysicsShape **)((char *)self->_shapes.__end_ - (char *)begin) != (PKPhysicsShape **)8)
    return 0;
  v4 = *begin;
  v5 = *(_DWORD *)(*((_QWORD *)(*begin)->var1 + 4) + 8);
  if (v5)
  {
    if (v5 == 3)
    {
      v6 = operator new();
      *(_OWORD *)(v6 + 8) = 0u;
      v33 = (void **)(v6 + 8);
      *(_OWORD *)(v6 + 24) = 0u;
      v34 = *((_QWORD *)v4->var1 + 4);
      v35 = *(_QWORD *)(v34 + 24) - *(_QWORD *)(v34 + 16);
      __p = 0;
      v90 = 0;
      v91 = 0;
      std::vector<b2Vec2>::resize((uint64_t)&__p, (int)(v35 >> 3));
      std::vector<PKPoint>::reserve((void **)(v6 + 8), (int)(v35 >> 3));
      if ((int)((unint64_t)v35 >> 3) >= 1)
      {
        v36 = 0;
        v37 = ((unint64_t)v35 >> 3);
        do
        {
          v38 = -[PKPhysicsBody _body](self, "_body", v88);
          var1 = (float32x2_t)v38->var8.var1;
          v40 = (float32x2_t)vrev64_s32((int32x2_t)var1);
          var1.f32[0] = -var1.f32[0];
          *(float32x2_t *)&v41 = vadd_f32((float32x2_t)v38->var8.var0, vmla_n_f32(vmul_n_f32(var1, *(float *)(*(_QWORD *)(v34 + 16) + 8 * v36 + 4)), v40, *(float *)(*(_QWORD *)(v34 + 16) + 8 * v36)));
          v88 = v41;
          *((_QWORD *)__p + v36) = v41;
          v42 = PKGet_PTM_RATIO();
          v43 = *((float *)__p + 2 * v36 + 1);
          v44 = v42 * *(float *)&v88;
          v45 = v43 * PKGet_PTM_RATIO();
          v47 = *(float **)(v6 + 16);
          v46 = *(_QWORD *)(v6 + 24);
          if ((unint64_t)v47 >= v46)
          {
            v49 = (float *)*v33;
            v50 = ((char *)v47 - (_BYTE *)*v33) >> 3;
            v51 = v50 + 1;
            if ((unint64_t)(v50 + 1) >> 61)
              std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
            v52 = v46 - (_QWORD)v49;
            if (v52 >> 2 > v51)
              v51 = v52 >> 2;
            if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8)
              v53 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v53 = v51;
            if (v53)
            {
              v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>(v6 + 24, v53);
              v49 = *(float **)(v6 + 8);
              v47 = *(float **)(v6 + 16);
            }
            else
            {
              v54 = 0;
            }
            v55 = (float *)&v54[8 * v50];
            *v55 = v44;
            v55[1] = v45;
            v56 = v55;
            if (v47 != v49)
            {
              do
              {
                v57 = *((_QWORD *)v47 - 1);
                v47 -= 2;
                *((_QWORD *)v56 - 1) = v57;
                v56 -= 2;
              }
              while (v47 != v49);
              v49 = (float *)*v33;
            }
            v48 = v55 + 2;
            *(_QWORD *)(v6 + 8) = v56;
            *(_QWORD *)(v6 + 16) = v55 + 2;
            *(_QWORD *)(v6 + 24) = &v54[8 * v53];
            if (v49)
              operator delete(v49);
          }
          else
          {
            *v47 = v44;
            v47[1] = v45;
            v48 = v47 + 2;
          }
          *(_QWORD *)(v6 + 16) = v48;
          ++v36;
        }
        while (v36 != v37);
      }
      goto LABEL_46;
    }
    if (v5 == 2)
    {
      v6 = operator new();
      *(_OWORD *)(v6 + 8) = 0u;
      v7 = (void **)(v6 + 8);
      *(_OWORD *)(v6 + 24) = 0u;
      v8 = *((_QWORD *)v4->var1 + 4);
      v9 = *(_QWORD *)(v8 + 24) - *(_QWORD *)(v8 + 16);
      __p = 0;
      v90 = 0;
      v91 = 0;
      std::vector<b2Vec2>::resize((uint64_t)&__p, (int)(v9 >> 3));
      std::vector<PKPoint>::reserve((void **)(v6 + 8), (int)(v9 >> 3));
      if ((int)((unint64_t)v9 >> 3) >= 1)
      {
        v10 = 0;
        v11 = ((unint64_t)v9 >> 3);
        do
        {
          v12 = -[PKPhysicsBody _body](self, "_body", v88);
          v13 = (float32x2_t)v12->var8.var1;
          v14 = (float32x2_t)vrev64_s32((int32x2_t)v13);
          v13.f32[0] = -v13.f32[0];
          *(float32x2_t *)&v15 = vadd_f32((float32x2_t)v12->var8.var0, vmla_n_f32(vmul_n_f32(v13, *(float *)(*(_QWORD *)(v8 + 16) + 8 * v10 + 4)), v14, *(float *)(*(_QWORD *)(v8 + 16) + 8 * v10)));
          v88 = v15;
          *((_QWORD *)__p + v10) = v15;
          v16 = PKGet_PTM_RATIO();
          v17 = *((float *)__p + 2 * v10 + 1);
          v18 = v16 * *(float *)&v88;
          v19 = v17 * PKGet_PTM_RATIO();
          v21 = *(float **)(v6 + 16);
          v20 = *(_QWORD *)(v6 + 24);
          if ((unint64_t)v21 >= v20)
          {
            v23 = (float *)*v7;
            v24 = ((char *)v21 - (_BYTE *)*v7) >> 3;
            v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 61)
              std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
            v26 = v20 - (_QWORD)v23;
            if (v26 >> 2 > v25)
              v25 = v26 >> 2;
            if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
              v27 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v27 = v25;
            if (v27)
            {
              v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>(v6 + 24, v27);
              v23 = *(float **)(v6 + 8);
              v21 = *(float **)(v6 + 16);
            }
            else
            {
              v28 = 0;
            }
            v29 = (float *)&v28[8 * v24];
            *v29 = v18;
            v29[1] = v19;
            v30 = v29;
            if (v21 != v23)
            {
              do
              {
                v31 = *((_QWORD *)v21 - 1);
                v21 -= 2;
                *((_QWORD *)v30 - 1) = v31;
                v30 -= 2;
              }
              while (v21 != v23);
              v23 = (float *)*v7;
            }
            v22 = v29 + 2;
            *(_QWORD *)(v6 + 8) = v30;
            *(_QWORD *)(v6 + 16) = v29 + 2;
            *(_QWORD *)(v6 + 24) = &v28[8 * v27];
            if (v23)
              operator delete(v23);
          }
          else
          {
            *v21 = v18;
            v21[1] = v19;
            v22 = v21 + 2;
          }
          *(_QWORD *)(v6 + 16) = v22;
          ++v10;
        }
        while (v10 != v11);
      }
LABEL_46:
      if (__p)
      {
        v90 = __p;
        operator delete(__p);
      }
      return (void *)v6;
    }
    return 0;
  }
  v6 = operator new();
  *(_OWORD *)(v6 + 8) = 0u;
  v58 = (void **)(v6 + 8);
  *(_OWORD *)(v6 + 24) = 0u;
  v59 = (_QWORD *)(v6 + 24);
  v60 = (float *)*((_QWORD *)v4->var1 + 4);
  v61 = v60[3];
  v62 = v61 * PKGet_PTM_RATIO();
  v63 = v60[4];
  v64 = v60[5];
  v65 = -[PKPhysicsBody _body](self, "_body");
  var0 = v65->var8.var1.var0;
  v66 = v65->var8.var1.var1;
  v68 = v65->var8.var0.x + (float)((float)(v66 * v63) - (float)(var0 * v64));
  v69 = (float)((float)(v64 * v66) + (float)(var0 * v63)) + v65->var8.var0.y;
  v70 = PKGet_PTM_RATIO();
  v71 = 0;
  v72 = 0;
  v73 = v68 * v70;
  v74 = v69 * v70;
  do
  {
    v75 = (float)((float)v72 * 0.125) * 6.28318531;
    v76 = __sincosf_stret(v75);
    v77 = v73 + (float)(v76.__cosval * v62);
    v78 = v74 + (float)(v76.__sinval * v62);
    if ((unint64_t)v71 >= *v59)
    {
      v79 = (float *)*v58;
      v80 = ((char *)v71 - (_BYTE *)*v58) >> 3;
      v81 = v80 + 1;
      if ((unint64_t)(v80 + 1) >> 61)
        std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
      v82 = *v59 - (_QWORD)v79;
      if (v82 >> 2 > v81)
        v81 = v82 >> 2;
      if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
        v83 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v83 = v81;
      if (v83)
      {
        v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)v59, v83);
        v79 = *(float **)(v6 + 8);
        v71 = *(float **)(v6 + 16);
      }
      else
      {
        v84 = 0;
      }
      v85 = (float *)&v84[8 * v80];
      *v85 = v77;
      v85[1] = v78;
      v86 = v85;
      if (v71 != v79)
      {
        do
        {
          v87 = *((_QWORD *)v71 - 1);
          v71 -= 2;
          *((_QWORD *)v86 - 1) = v87;
          v86 -= 2;
        }
        while (v71 != v79);
        v79 = (float *)*v58;
      }
      v71 = v85 + 2;
      *(_QWORD *)(v6 + 8) = v86;
      *(_QWORD *)(v6 + 16) = v85 + 2;
      *(_QWORD *)(v6 + 24) = &v84[8 * v83];
      if (v79)
        operator delete(v79);
    }
    else
    {
      *v71 = v77;
      v71[1] = v78;
      v71 += 2;
    }
    *(_QWORD *)(v6 + 16) = v71;
    ++v72;
  }
  while (v72 != 8);
  return (void *)v6;
}

- (void)clearBox2DData
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  uint64_t v5;

  self->_body = 0;
  self->_inUse = 0;
  objc_storeWeak((id *)&self->_world, 0);
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  while (begin != end)
  {
    v5 = (uint64_t)*begin++;
    *(_QWORD *)(v5 + 40) = 0;
  }
}

+ (id)bodyWithOutline:(shared_ptr<PKPath>)a3 offset:(CGPoint)a4
{
  uint64_t *ptr;
  uint64_t *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  CGPath *Mutable;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  PKPhysicsBody *v23;
  PKPhysicsBody *v24;
  id v25;
  void *v26;
  void *v27;
  float32x2_t *v28;
  float32x2_t *v29;
  float64x2_t v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  __int128 v40;
  float64_t v41;
  double x;
  float64x2_t v43;
  void *v44;
  std::__shared_weak_count *v45;
  void *__p;
  std::__shared_weak_count *v47;
  char *v48;
  void *v49;
  _BYTE *v50;
  uint64_t v51;
  void *v52;
  _BYTE *v53;
  uint64_t v54;

  v40 = *(__int128 *)&a4.y;
  x = a4.x;
  ptr = (uint64_t *)a3.__ptr_;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v47 = 0;
  v48 = 0;
  __p = 0;
  v5 = *(uint64_t **)(*(_QWORD *)a3.__ptr_ + 8);
  if (v5 != *(uint64_t **)(*(_QWORD *)a3.__ptr_ + 16))
  {
    v6 = 0;
    do
    {
      v7 = *v5;
      if (v6 >= v48)
      {
        v8 = (v6 - (_BYTE *)__p) >> 3;
        if ((unint64_t)(v8 + 1) >> 61)
          std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
        v9 = (v48 - (_BYTE *)__p) >> 2;
        if (v9 <= v8 + 1)
          v9 = v8 + 1;
        if ((unint64_t)(v48 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
          v10 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v10 = v9;
        if (v10)
          v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)&v48, v10);
        else
          v11 = 0;
        v12 = &v11[8 * v8];
        *(_QWORD *)v12 = v7;
        v6 = v12 + 8;
        v14 = (char *)__p;
        v13 = (char *)v47;
        if (v47 != __p)
        {
          do
          {
            v15 = *((_QWORD *)v13 - 1);
            v13 -= 8;
            *((_QWORD *)v12 - 1) = v15;
            v12 -= 8;
          }
          while (v13 != v14);
          v13 = (char *)__p;
        }
        __p = v12;
        v47 = (std::__shared_weak_count *)v6;
        v48 = &v11[8 * v10];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *(_QWORD *)v6 = v7;
        v6 += 8;
      }
      v47 = (std::__shared_weak_count *)v6;
      ++v5;
    }
    while (v5 != *(uint64_t **)(*ptr + 16));
  }
  trisFromCCWFaces((uint64_t)&__p, (char **)&v49, &v52);
  if (__p)
  {
    v47 = (std::__shared_weak_count *)__p;
    operator delete(__p);
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v53 != v52)
  {
    v17 = 0;
    do
    {
      Mutable = CGPathCreateMutable();
      if (((v53 - (_BYTE *)v52) >> 2) - 1 == v17)
        v19 = (unint64_t)(v50 - (_BYTE *)v49) >> 3;
      else
        LODWORD(v19) = *((_DWORD *)v52 + v17 + 1);
      v20 = *((int *)v52 + v17);
      if ((int)v19 > (int)v20)
      {
        v21 = 0;
        v22 = v19 - v20;
        do
        {
          if (v21)
            CGPathAddLineToPoint(Mutable, 0, COERCE_FLOAT(*((_QWORD *)v49 + v20 + v21)) - x, COERCE_FLOAT(HIDWORD(*((_QWORD *)v49 + v20 + v21))) - *(double *)&v40);
          else
            CGPathMoveToPoint(Mutable, 0, COERCE_FLOAT(*((_QWORD *)v49 + v20)) - x, COERCE_FLOAT(HIDWORD(*((_QWORD *)v49 + v20))) - *(double *)&v40);
          ++v21;
        }
        while (v22 != (_DWORD)v21);
      }
      CGPathCloseSubpath(Mutable);
      v23 = -[PKPhysicsBody initWithPolygonFromPath:]([PKPhysicsBody alloc], "initWithPolygonFromPath:", Mutable);
      v24 = v23;
      if (v23)
      {
        -[PKPhysicsBody setDynamic:](v23, "setDynamic:", 1);
        objc_msgSend(v16, "addObject:", v24);
      }
      CGPathRelease(Mutable);

      ++v17;
    }
    while (v17 < (v53 - (_BYTE *)v52) >> 2);
  }
  if (objc_msgSend(v16, "count", v40))
  {
    if (objc_msgSend(v16, "count") == 1)
    {
      objc_msgSend(v16, "objectAtIndex:", 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PKPhysicsBody bodyWithBodies:](PKPhysicsBody, "bodyWithBodies:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      std::allocate_shared[abi:ne180100]<PKPath,std::allocator<PKPath>,PKPath&,void>(*ptr, &__p);
      v27 = __p;
      v28 = (float32x2_t *)*((_QWORD *)__p + 1);
      v29 = (float32x2_t *)*((_QWORD *)__p + 2);
      if (v28 != v29)
      {
        v30.f64[0] = x;
        v30.f64[1] = v41;
        v43 = v30;
        do
        {
          *v28 = vcvt_f32_f64(vsubq_f64(vcvtq_f64_f32(*v28), v43));
          v28->f32[0] = PKGet_INV_PTM_RATIO() * v28->f32[0];
          v28->f32[1] = PKGet_INV_PTM_RATIO() * v28->f32[1];
          ++v28;
        }
        while (v28 != v29);
        v27 = __p;
      }
      v44 = v27;
      v45 = v47;
      if (v47)
      {
        p_shared_owners = (unint64_t *)&v47->__shared_owners_;
        do
          v32 = __ldxr(p_shared_owners);
        while (__stxr(v32 + 1, p_shared_owners));
      }
      objc_msgSend(v26, "setOutline:", &v44);
      v33 = v45;
      if (v45)
      {
        v34 = (unint64_t *)&v45->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v25 = v26;
      v36 = v47;
      if (v47)
      {
        v37 = (unint64_t *)&v47->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }

    }
  }
  else
  {
    NSLog(CFSTR("PhysicsBody: Could not create physics body."));
    v25 = 0;
  }

  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  PKPath *ptr;
  void *v10;
  float *v11;
  float *v12;
  unint64_t v13;
  PKPhysicsShape **i;
  uint64_t var0;
  const __CFString *v16;
  float v17;
  float v18;
  __CFString *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  __CFString *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  unint64_t v35;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_shapeType, CFSTR("_shapeType"));
  switch(self->_shapeType)
  {
    case 1:
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_radius"), self->_radius);
      goto LABEL_6;
    case 2:
      objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("_size"), self->_size.width, self->_size.height);
LABEL_6:
      v6 = CFSTR("_p0");
      v7 = 208;
      v8 = 200;
      goto LABEL_8;
    case 3:
    case 5:
    case 6:
      PKArrayFromPKPath((uint64_t)self->_pathPtr.__ptr_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_path"));

      break;
    case 4:
      objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_p0"), self->_p0.x, self->_p0.y);
      v6 = CFSTR("_p1");
      v7 = 224;
      v8 = 216;
LABEL_8:
      objc_msgSend(v4, "encodeCGPoint:forKey:", v6, *(double *)((char *)&self->super.isa + v8), *(double *)((char *)&self->super.isa + v7));
      break;
    case 7:
      objc_msgSend(v4, "encodeInt32:forKey:", (unint64_t)((char *)self->_shapes.__end_ - (char *)self->_shapes.__begin_) >> 3, CFSTR("_compoundBodyCount"));
      for (i = self->_shapes.__begin_; i != self->_shapes.__end_; ++i)
      {
        var0 = (uint64_t)(*i)->var0.var0;
        v16 = CFSTR("chain");
        switch(*(_DWORD *)(var0 + 8))
        {
          case 0:
            objc_msgSend(v4, "encodeObject:", CFSTR("circle"));
            v17 = *(float *)(var0 + 12);
            v18 = PKGet_PTM_RATIO();
            v19 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%g, %g}"), (float)(v17 * v18), 0);
            objc_msgSend(v4, "encodeObject:", v19);

            v20 = *(float *)(var0 + 16);
            v21 = PKGet_PTM_RATIO();
            v22 = *(float *)(var0 + 20);
            v23 = PKGet_PTM_RATIO();
            v24 = (void *)CFStringCreateWithFormat(0, 0, CFSTR("{%g, %g}"), (float)(v20 * v21), (float)(v22 * v23));
            objc_msgSend(v4, "encodeObject:", v24);
            goto LABEL_20;
          case 1:
            objc_msgSend(v4, "encodeObject:", CFSTR("edge"));
            v25 = *(float *)(var0 + 16);
            v26 = PKGet_PTM_RATIO();
            v27 = *(float *)(var0 + 20);
            v28 = PKGet_PTM_RATIO();
            v29 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%g, %g}"), (float)(v25 * v26), (float)(v27 * v28));
            objc_msgSend(v4, "encodeObject:", v29);

            v30 = *(float *)(var0 + 24);
            v31 = PKGet_PTM_RATIO();
            v32 = *(float *)(var0 + 28);
            v33 = PKGet_PTM_RATIO();
            v24 = (void *)CFStringCreateWithFormat(0, 0, CFSTR("{%g, %g}"), (float)(v30 * v31), (float)(v32 * v33));
            objc_msgSend(v4, "encodeObject:", v24);
            goto LABEL_20;
          case 2:
            objc_msgSend(v4, "encodeObject:", CFSTR("polygon"));
            PKArrayFromB2PolygonShape(var0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "encodeObject:", v24);
LABEL_20:

            continue;
          case 3:
            goto LABEL_22;
          case 4:
            v16 = CFSTR("quadtree");
LABEL_22:
            objc_msgSend(v4, "encodeObject:", v16);
            break;
          default:
            continue;
        }
      }
      break;
    default:
      NSLog(CFSTR("ENCODE ERROR"));
      break;
  }
  ptr = self->_outline.__ptr_;
  if (ptr)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 2 * (*((_QWORD *)ptr + 2) - *((_QWORD *)ptr + 1)));
    v11 = (float *)*((_QWORD *)ptr + 1);
    v12 = (float *)*((_QWORD *)ptr + 2);
    while (v11 != v12)
    {
      v13 = bswap64(COERCE_UNSIGNED_INT64(*v11));
      v34 = bswap64(COERCE_UNSIGNED_INT64(v11[1]));
      v35 = v13;
      objc_msgSend(v10, "appendBytes:length:", &v35, 8);
      objc_msgSend(v10, "appendBytes:length:", &v34, 8);
      v11 += 2;
    }
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_outline"));

  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_edgeRadius"), self->_edgeRadius);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody isDynamic](self, "isDynamic"), CFSTR("dynamic"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection"), CFSTR("needsContinuousCollsionDetection"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody allowsRotation](self, "allowsRotation"), CFSTR("allowRotation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody pinned](self, "pinned"), CFSTR("pinned"));
  -[PKPhysicsBody friction](self, "friction");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("friction"));
  -[PKPhysicsBody charge](self, "charge");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("charge"));
  -[PKPhysicsBody restitution](self, "restitution");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("restitution"));
  -[PKPhysicsBody density](self, "density");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("density"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody affectedByGravity](self, "affectedByGravity"), CFSTR("affectedByGravity"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody categoryBitMask](self, "categoryBitMask"), CFSTR("categoryBitMask"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody collisionBitMask](self, "collisionBitMask"), CFSTR("collisionBitMask"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody contactTestBitMask](self, "contactTestBitMask"), CFSTR("intersectionTestBitMask"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody fieldBitMask](self, "fieldBitMask"), CFSTR("fieldBitMask"));
  -[PKPhysicsBody velocity](self, "velocity");
  objc_msgSend(v4, "encodeCGVector:forKey:", CFSTR("linearVelocity"));
  -[PKPhysicsBody angularVelocity](self, "angularVelocity");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("angularVelocity"));
  -[PKPhysicsBody linearDamping](self, "linearDamping");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("linearDamping"));
  -[PKPhysicsBody angularDamping](self, "angularDamping");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("angularDamping"));

}

- (PKPhysicsBody)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  double x;
  CGFloat v10;
  double y;
  PKPhysicsBody *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  PKPhysicsBody *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float v57;
  float v58;
  CGPath *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *p_shared_owners;
  unint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  id v70;
  int8x16_t *v71;
  unint64_t v72;
  float32x2_t **v73;
  unint64_t v74;
  float32x2_t *v75;
  uint64_t v76;
  int8x16_t v77;
  char *v78;
  unint64_t *v79;
  float v80;
  double v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  float32x2_t *v86;
  CGFloat v87;
  unint64_t *v88;
  unint64_t v89;
  char *v91;
  std::__shared_weak_count *v92;
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  CGPoint v97;
  CGPoint v98;
  _QWORD v99[7];
  _QWORD v100[7];
  _QWORD v101[9];

  v101[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self)
  {
    v12 = 0;
    goto LABEL_43;
  }
  self->_shapeType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_shapeType"));
  self->_edgeRadius = 0.00899999961;
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("_edgeRadius")))
  {
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("_edgeRadius"));
    self->_edgeRadius = v6;
  }
  switch(self->_shapeType)
  {
    case 1:
      objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("_radius"));
      self->_radius = v7;
      self->_p0 = (CGPoint)*MEMORY[0x24BDBEFB0];
      if ((objc_msgSend(v5, "containsValueForKey:", CFSTR("_p0")) & 1) != 0)
      {
        objc_msgSend(v5, "decodeCGPointForKey:", CFSTR("_p0"));
        x = v8;
        y = v10;
        self->_p0.x = v8;
        self->_p0.y = v10;
      }
      else
      {
        x = self->_p0.x;
        y = self->_p0.y;
      }
      v27 = -[PKPhysicsBody initWithCircleOfRadius:center:](self, "initWithCircleOfRadius:center:", self->_radius, x, y);
      goto LABEL_42;
    case 2:
      objc_msgSend(v5, "decodeCGSizeForKey:", CFSTR("_size"));
      self->_size.width = v13;
      self->_size.height = v14;
      self->_p0 = (CGPoint)*MEMORY[0x24BDBEFB0];
      if ((objc_msgSend(v5, "containsValueForKey:", CFSTR("_p0")) & 1) != 0)
      {
        objc_msgSend(v5, "decodeCGPointForKey:", CFSTR("_p0"));
        v16 = v15;
        v18 = v17;
        self->_p0.x = v15;
        self->_p0.y = v17;
      }
      else
      {
        v16 = self->_p0.x;
        v18 = self->_p0.y;
      }
      v27 = -[PKPhysicsBody initWithRectangleOfSize:center:](self, "initWithRectangleOfSize:center:", self->_size.width, self->_size.height, v16, v18);
      goto LABEL_42;
    case 3:
      v19 = (void *)MEMORY[0x24BDBCF20];
      v101[0] = objc_opt_class();
      v101[1] = objc_opt_class();
      v101[2] = objc_opt_class();
      v101[3] = objc_opt_class();
      v101[4] = objc_opt_class();
      v101[5] = objc_opt_class();
      v101[6] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v21, CFSTR("_path"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPhysicsBody initWithPolygonFromPath:](self, "initWithPolygonFromPath:", PKCGPathCreateFromArray(v22, 0));
      goto LABEL_43;
    case 4:
      objc_msgSend(v5, "decodeCGPointForKey:", CFSTR("_p0"));
      self->_p0.x = v23;
      self->_p0.y = v24;
      objc_msgSend(v5, "decodeCGPointForKey:", CFSTR("_p1"));
      self->_p1.x = v25;
      self->_p1.y = v26;
      v27 = -[PKPhysicsBody initWithEdgeFromPoint:toPoint:](self, "initWithEdgeFromPoint:toPoint:", self->_p0.x, self->_p0.y, v25, v26);
LABEL_42:
      v12 = v27;
      goto LABEL_43;
    case 5:
      v28 = (void *)MEMORY[0x24BDBCF20];
      v100[0] = objc_opt_class();
      v100[1] = objc_opt_class();
      v100[2] = objc_opt_class();
      v100[3] = objc_opt_class();
      v100[4] = objc_opt_class();
      v100[5] = objc_opt_class();
      v100[6] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v30, CFSTR("_path"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPhysicsBody initWithEdgeChainFromPath:](self, "initWithEdgeChainFromPath:", PKCGPathCreateFromArray(v31, 0));
      goto LABEL_43;
    case 6:
      v32 = (void *)MEMORY[0x24BDBCF20];
      v99[0] = objc_opt_class();
      v99[1] = objc_opt_class();
      v99[2] = objc_opt_class();
      v99[3] = objc_opt_class();
      v99[4] = objc_opt_class();
      v99[5] = objc_opt_class();
      v99[6] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v34, CFSTR("_path"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPhysicsBody initWithEdgeLoopFromPath:](self, "initWithEdgeLoopFromPath:", PKCGPathCreateFromArray(v35, 0));
      goto LABEL_43;
    case 7:
      v12 = objc_alloc_init(PKPhysicsBody);

      v36 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("_compoundBodyCount"));
      if (v36 < 1)
        goto LABEL_37;
      v37 = 0;
      break;
    default:
      NSLog(CFSTR("DECODE ERROR"));
      v12 = self;
      goto LABEL_43;
  }
  do
  {
    objc_msgSend(v5, "decodeObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isEqualToString:", CFSTR("circle")))
    {
      objc_msgSend(v5, "decodeObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = PKCGPointFromString(v39);
      objc_msgSend(v5, "decodeObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = PKCGPointFromString(v41);
      v44 = v43;
      v45 = PKGet_INV_PTM_RATIO();
      v46 = PKGet_INV_PTM_RATIO();
      v47 = PKGet_INV_PTM_RATIO();
      v48 = v40 * v45;
      v98.x = v42 * v46;
      v98.y = v44 * v47;
      addCircleBody(v12, v48, &v98);
    }
    else if (objc_msgSend(v38, "isEqualToString:", CFSTR("edge")))
    {
      objc_msgSend(v5, "decodeObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = PKCGPointFromString(v49);
      v52 = v51;
      objc_msgSend(v5, "decodeObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = PKCGPointFromString(v41);
      v55 = v54;
      v56 = PKGet_INV_PTM_RATIO();
      v57 = PKGet_INV_PTM_RATIO();
      v98.x = v50 * v56;
      v98.y = v52 * v57;
      LODWORD(v52) = PKGet_INV_PTM_RATIO();
      v58 = PKGet_INV_PTM_RATIO();
      v97.x = v53 * *(float *)&v52;
      v97.y = v55 * v58;
      addEdge(v12, &v98, &v97);
    }
    else
    {
      if (objc_msgSend(v38, "isEqualToString:", CFSTR("polygon")))
      {
        objc_msgSend(v5, "decodeObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = PKCGPathCreateFromArray(v41, 1);
        v60 = PKPathCreateFromCGPathWithOptions(v59, 10, 10.0);
        std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v95, v60);
        addPolygonFromPath(v12, &v95);
        v61 = v96;
        if (v96)
        {
          p_shared_owners = (unint64_t *)&v96->__shared_owners_;
          do
            v63 = __ldaxr(p_shared_owners);
          while (__stlxr(v63 - 1, p_shared_owners));
          if (!v63)
          {
            ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
            std::__shared_weak_count::__release_weak(v61);
          }
        }
      }
      else
      {
        if (!objc_msgSend(v38, "isEqualToString:", CFSTR("chain")))
          goto LABEL_36;
        objc_msgSend(v5, "decodeObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = PKCGPathCreateFromArray(v41, 1);
        v64 = PKPathCreateFromCGPathWithOptions(v59, 10, 10.0);
        std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v93, v64);
        addEdgeChain(v12, &v93);
        v65 = v94;
        if (v94)
        {
          v66 = (unint64_t *)&v94->__shared_owners_;
          do
            v67 = __ldaxr(v66);
          while (__stlxr(v67 - 1, v66));
          if (!v67)
          {
            ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
            std::__shared_weak_count::__release_weak(v65);
          }
        }
      }
      CGPathRelease(v59);
    }

LABEL_36:
    ++v37;
  }
  while (v37 != v36);
LABEL_37:
  v12->_shapeType = 7;
LABEL_43:
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_outline"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    v70 = objc_retainAutorelease(v68);
    v71 = (int8x16_t *)objc_msgSend(v70, "bytes");
    v72 = objc_msgSend(v70, "length");
    if (v72 > 0xF)
    {
      v73 = (float32x2_t **)operator new();
      v74 = v72 >> 4;
      std::vector<PKPoint>::vector(v73, v74);
      v75 = *v73;
      if (v74 <= 1)
        v76 = 1;
      else
        v76 = v74;
      do
      {
        v77 = *v71++;
        *v75++ = vcvt_f32_f64((float64x2_t)vrev64q_s8(v77));
        --v76;
      }
      while (v76);

      v78 = (char *)operator new(0x40uLL);
      *((_QWORD *)v78 + 1) = 0;
      v79 = (unint64_t *)(v78 + 8);
      *((_QWORD *)v78 + 2) = 0;
      *(_QWORD *)v78 = &unk_24C0E8D28;
      v80 = 0.0;
      *((_OWORD *)v78 + 2) = 0u;
      *((_OWORD *)v78 + 3) = 0u;
      *(_QWORD *)&v98.x = v78 + 24;
      *(_QWORD *)&v98.y = v78;
      if (v78 + 32 != (char *)v73)
        std::vector<PKPoint>::__assign_with_size[abi:ne180100]<PKPoint*,PKPoint*>(v78 + 32, (char *)*v73, (uint64_t)v73[1], v73[1] - *v73);
      *(float *)&v81 = PKPath::computeLength((PKPath *)(v78 + 24), v80);
      v91 = v78 + 24;
      v92 = (std::__shared_weak_count *)v78;
      do
        v82 = __ldxr(v79);
      while (__stxr(v82 + 1, v79));
      -[PKPhysicsBody setOutline:](v12, "setOutline:", &v91, v81);
      v83 = v92;
      if (v92)
      {
        v84 = (unint64_t *)&v92->__shared_owners_;
        do
          v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
          std::__shared_weak_count::__release_weak(v83);
        }
      }
      v86 = *v73;
      if (*v73)
      {
        v73[1] = v86;
        operator delete(v86);
      }
      MEMORY[0x20BD0BA58](v73, 0x20C40960023A9);
      v87 = v98.y;
      if (*(_QWORD *)&v98.y)
      {
        v88 = (unint64_t *)(*(_QWORD *)&v98.y + 8);
        do
          v89 = __ldaxr(v88);
        while (__stlxr(v89 - 1, v88));
        if (!v89)
        {
          (*(void (**)(CGFloat))(**(_QWORD **)&v87 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v87));
          std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v87);
        }
      }
    }
    else
    {

    }
  }
  -[PKPhysicsBody setDynamic:](v12, "setDynamic:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("dynamic")));
  -[PKPhysicsBody setUsesPreciseCollisionDetection:](v12, "setUsesPreciseCollisionDetection:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("needsContinuousCollsionDetection")));
  -[PKPhysicsBody setAllowsRotation:](v12, "setAllowsRotation:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("allowRotation")));
  -[PKPhysicsBody setPinned:](v12, "setPinned:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("pinned")));
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("friction"));
  -[PKPhysicsBody setFriction:](v12, "setFriction:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("charge"));
  -[PKPhysicsBody setCharge:](v12, "setCharge:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("restitution"));
  -[PKPhysicsBody setRestitution:](v12, "setRestitution:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("density"));
  -[PKPhysicsBody setDensity:](v12, "setDensity:");
  -[PKPhysicsBody setAffectedByGravity:](v12, "setAffectedByGravity:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("affectedByGravity")));
  -[PKPhysicsBody setCategoryBitMask:](v12, "setCategoryBitMask:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("categoryBitMask")));
  -[PKPhysicsBody setCollisionBitMask:](v12, "setCollisionBitMask:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("collisionBitMask")));
  -[PKPhysicsBody setContactTestBitMask:](v12, "setContactTestBitMask:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("intersectionTestBitMask")));
  -[PKPhysicsBody setFieldBitMask:](v12, "setFieldBitMask:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("fieldBitMask")));
  objc_msgSend(v5, "decodeCGVectorForKey:", CFSTR("linearVelocity"));
  -[PKPhysicsBody setVelocity:](v12, "setVelocity:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("angularVelocity"));
  -[PKPhysicsBody setAngularVelocity:](v12, "setAngularVelocity:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("linearDamping"));
  -[PKPhysicsBody setLinearDamping:](v12, "setLinearDamping:");
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("angularDamping"));
  -[PKPhysicsBody setAngularDamping:](v12, "setAngularDamping:");

  return v12;
}

- (BOOL)isEqualToBody:(id)a3
{
  PKPhysicsBody *v4;
  uint64_t *v5;
  PKPath *ptr;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  PKPath *v20;
  unint64_t v21;
  BOOL v22;

  v4 = (PKPhysicsBody *)a3;
  v5 = (uint64_t *)v4;
  if (self == v4)
    goto LABEL_20;
  if (self->_shapeType != v4->_shapeType)
    goto LABEL_21;
  ptr = self->_pathPtr.__ptr_;
  v7 = v5[21];
  if (!ptr)
  {
    if (!v7)
      goto LABEL_8;
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  if (!v7)
    goto LABEL_21;
  PKArrayFromPKPath((uint64_t)ptr);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKArrayFromPKPath(v5[21]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_21;
LABEL_8:
  v11 = -[PKPhysicsBody isDynamic](self, "isDynamic");
  if (v11 != objc_msgSend(v5, "isDynamic"))
    goto LABEL_21;
  v12 = -[PKPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection");
  if (v12 != objc_msgSend(v5, "usesPreciseCollisionDetection"))
    goto LABEL_21;
  v13 = -[PKPhysicsBody allowsRotation](self, "allowsRotation");
  if (v13 != objc_msgSend(v5, "allowsRotation"))
    goto LABEL_21;
  v14 = -[PKPhysicsBody pinned](self, "pinned");
  if (v14 != objc_msgSend(v5, "pinned"))
    goto LABEL_21;
  v15 = -[PKPhysicsBody affectedByGravity](self, "affectedByGravity");
  if (v15 != objc_msgSend(v5, "affectedByGravity"))
    goto LABEL_21;
  v16 = -[PKPhysicsBody categoryBitMask](self, "categoryBitMask");
  if (v16 != objc_msgSend(v5, "categoryBitMask"))
    goto LABEL_21;
  v17 = -[PKPhysicsBody collisionBitMask](self, "collisionBitMask");
  if (v17 != objc_msgSend(v5, "collisionBitMask"))
    goto LABEL_21;
  v18 = -[PKPhysicsBody fieldBitMask](self, "fieldBitMask");
  if (v18 != objc_msgSend(v5, "fieldBitMask"))
    goto LABEL_21;
  v19 = -[PKPhysicsBody contactTestBitMask](self, "contactTestBitMask");
  if (v19 != objc_msgSend(v5, "contactTestBitMask"))
    goto LABEL_21;
  -[PKPhysicsBody area](self, "area");
  objc_msgSend(v5, "area");
  -[PKPhysicsBody friction](self, "friction");
  objc_msgSend(v5, "friction");
  -[PKPhysicsBody charge](self, "charge");
  objc_msgSend(v5, "charge");
  -[PKPhysicsBody restitution](self, "restitution");
  objc_msgSend(v5, "restitution");
  -[PKPhysicsBody density](self, "density");
  objc_msgSend(v5, "density");
  -[PKPhysicsBody mass](self, "mass");
  objc_msgSend(v5, "mass");
  -[PKPhysicsBody velocity](self, "velocity");
  objc_msgSend(v5, "velocity");
  -[PKPhysicsBody velocity](self, "velocity");
  objc_msgSend(v5, "velocity");
  -[PKPhysicsBody angularVelocity](self, "angularVelocity");
  objc_msgSend(v5, "angularVelocity");
  -[PKPhysicsBody linearDamping](self, "linearDamping");
  objc_msgSend(v5, "linearDamping");
  -[PKPhysicsBody angularDamping](self, "angularDamping");
  objc_msgSend(v5, "angularDamping");
  v20 = self->_outline.__ptr_;
  v21 = v5[34];
  v22 = ((unint64_t)v20 | v21) == 0;
  if (v20 && v21)
  {
    PKPath::isEqualToPath(v20, (PKPath *)v21);
LABEL_20:
    v22 = 1;
  }
LABEL_22:

  return v22;
}

- (PKPhysicsBody)init
{
  PKPhysicsBody *v2;
  PKPhysicsBody *v3;
  uint64_t v4;
  NSMutableArray *joints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPhysicsBody;
  v2 = -[PKPhysicsBody init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isPinned = 256;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    joints = v3->_joints;
    v3->_joints = (NSMutableArray *)v4;

    v3->_shapes.__end_ = v3->_shapes.__begin_;
    *(int32x2_t *)&v3->_bodyDef.linearDamping = vdup_n_s32(0x3DCCCCCDu);
    v3->_bodyDef.allowSleep = 0;
    v3->_dynamicType = 2;
    v3->_bodyDef.type = 2;
    v3->_body = 0;
    v3->_inUse = 0;
    objc_storeWeak((id *)&v3->_representedObject, 0);
    v3->_edgeRadius = 0.00899999961;
    std::shared_ptr<QuadTree>::reset[abi:ne180100](&v3->_quadTree.__ptr_);
    std::shared_ptr<QuadTree>::reset[abi:ne180100](&v3->_pathPtr.__ptr_);
    std::shared_ptr<QuadTree>::reset[abi:ne180100](&v3->_outline.__ptr_);
  }
  return v3;
}

- (void)dealloc
{
  PKPhysicsShape **end;
  PKPhysicsShape **begin;
  PKPhysicsShape *v5;
  objc_super v6;

  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  while (begin != end)
  {
    v5 = *begin;
    if (*begin)
    {
      if (v5->var0.var0)
        (*(void (**)(b2Shape *, SEL))(*(_QWORD *)v5->var0.var0 + 8))(v5->var0.var0, a2);
      MEMORY[0x20BD0BA58](v5, 0x10E0C40EA88CBB9);
      end = self->_shapes.__end_;
    }
    ++begin;
  }
  std::shared_ptr<QuadTree>::reset[abi:ne180100](&self->_outline.__ptr_);
  self->_shapes.__end_ = self->_shapes.__begin_;
  v6.receiver = self;
  v6.super_class = (Class)PKPhysicsBody;
  -[PKPhysicsBody dealloc](&v6, sel_dealloc);
}

- (PKPhysicsBody)initWithBodies:(id)a3
{
  PKPhysicsBody *v4;
  uint64_t v5;
  vector<PKPhysicsShape *, std::allocator<PKPhysicsShape *>> *p_shapes;
  uint64_t v7;
  void *v8;
  PKPhysicsShape **i;
  PKPhysicsShape *v10;
  PKPhysicsShape **value;
  PKPhysicsShape **end;
  PKPhysicsShape **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  PKPhysicsShape **v19;
  PKPhysicsShape **v20;
  PKPhysicsShape **begin;
  PKPhysicsShape *v22;
  _QWORD *v23;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v4 = -[PKPhysicsBody init](self, "init");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v25, 1);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v27 = *(_QWORD *)v30;
    p_shapes = &v4->_shapes;
    do
    {
      v7 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        for (i = *(PKPhysicsShape ***)objc_msgSend(v8, "_shapes");
              i != *(PKPhysicsShape ***)(objc_msgSend(v8, "_shapes") + 8);
              ++i)
        {
          v10 = *i;
          end = v4->_shapes.__end_;
          value = v4->_shapes.__end_cap_.__value_;
          if (end >= value)
          {
            v14 = end - p_shapes->__begin_;
            if ((unint64_t)(v14 + 1) >> 61)
              std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
            v15 = (char *)value - (char *)p_shapes->__begin_;
            v16 = v15 >> 2;
            if (v15 >> 2 <= (unint64_t)(v14 + 1))
              v16 = v14 + 1;
            if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
              v17 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v17 = v16;
            if (v17)
              v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)&v4->_shapes.__end_cap_, v17);
            else
              v18 = 0;
            v19 = (PKPhysicsShape **)&v18[8 * v14];
            *v19 = v10;
            v13 = v19 + 1;
            begin = v4->_shapes.__begin_;
            v20 = v4->_shapes.__end_;
            if (v20 != begin)
            {
              do
              {
                v22 = *--v20;
                *--v19 = v22;
              }
              while (v20 != begin);
              v20 = p_shapes->__begin_;
            }
            v4->_shapes.__begin_ = v19;
            v4->_shapes.__end_ = v13;
            v4->_shapes.__end_cap_.__value_ = (PKPhysicsShape **)&v18[8 * v17];
            if (v20)
              operator delete(v20);
          }
          else
          {
            *end = v10;
            v13 = end + 1;
          }
          v4->_shapes.__end_ = v13;
        }
        v23 = (_QWORD *)objc_msgSend(v8, "_shapes");
        v23[1] = *v23;
        ++v7;
      }
      while (v7 != v28);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  v4->_shapeType = 7;
  return v4;
}

- (PKPhysicsBody)initWithCircleOfRadius:(double)a3
{
  return -[PKPhysicsBody initWithCircleOfRadius:center:](self, "initWithCircleOfRadius:center:", a3, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (PKPhysicsBody)initWithCircleOfRadius:(double)a3 center:(CGPoint)a4
{
  PKPhysicsBody *v5;
  float v6;
  CGPoint v8;

  v5 = -[PKPhysicsBody init](self, "init", *(_QWORD *)&a4.x, *(_QWORD *)&a4.y);
  v6 = a3;
  addCircleBody(v5, v6, &v8);
  return v5;
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3
{
  double edgeRadius;

  edgeRadius = self->_edgeRadius;
  *(float *)&edgeRadius = edgeRadius;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](self, "initWithRectangleOfSize:center:edgeRadius:", a3.width, a3.height, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), edgeRadius);
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  double edgeRadius;

  edgeRadius = self->_edgeRadius;
  *(float *)&edgeRadius = edgeRadius;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](self, "initWithRectangleOfSize:center:edgeRadius:", a3.width, a3.height, a4.x, a4.y, edgeRadius);
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(float)a5
{
  PKPhysicsBody *v6;
  CGPoint v8;
  CGSize v9;

  v6 = -[PKPhysicsBody init](self, "init", *(_QWORD *)&a4.x, *(_QWORD *)&a4.y, *(_QWORD *)&a3.width, *(_QWORD *)&a3.height);
  if (!addRectangle(v6, &v9, &v8, a5))
  {

    return 0;
  }
  return v6;
}

- (PKPhysicsBody)initWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  PKPhysicsBody *v4;
  CGPoint v6;
  CGPoint v7;

  v4 = -[PKPhysicsBody init](self, "init", *(_QWORD *)&a4.x, *(_QWORD *)&a4.y, *(_QWORD *)&a3.x, *(_QWORD *)&a3.y);
  addEdge(v4, &v7, &v6);
  return v4;
}

- (PKPhysicsBody)initWithPolygonFromPath:(CGPath *)a3
{
  PKPhysicsBody *v4;
  uint64_t v5;
  char v6;
  char v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = -[PKPhysicsBody init](self, "init");
  v5 = PKPathCreateFromCGPathWithOptions(a3, 10, 10.0);
  std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v12, v5);
  v6 = addPolygonFromPath(v4, &v12);
  v7 = v6;
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if ((v7 & 1) != 0)
        return v4;
      goto LABEL_6;
    }
  }
  if ((v6 & 1) == 0)
  {
LABEL_6:

    return 0;
  }
  return v4;
}

- (PKPhysicsBody)initWithEdgeChainFromPath:(CGPath *)a3
{
  PKPhysicsBody *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = -[PKPhysicsBody init](self, "init");
  v5 = PKPathCreateFromCGPathWithOptions(a3, 10, 10.0);
  std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v10, v5);
  addEdgeChain(v4, &v10);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v4;
}

- (PKPhysicsBody)initWithEdgeLoopFromPath:(CGPath *)a3
{
  PKPhysicsBody *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = -[PKPhysicsBody init](self, "init");
  v5 = PKPathCreateFromCGPathWithOptions(a3, 10, 10.0);
  std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v10, v5);
  addEdgeLoop(v4, &v10);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v4;
}

+ (id)initWithQuadTree:(id)a3
{
  uint64_t *v3;
  PKPhysicsBody *v4;
  PKPhysicsBody *v5;
  uint64_t v6;
  float edgeRadius;
  uint64_t v8;
  unint64_t value;
  uint64_t *end;
  PKPhysicsShape **v11;
  PKPhysicsShape **begin;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t *v18;
  PKPhysicsShape **v19;
  PKPhysicsShape **v20;
  PKPhysicsShape **v21;
  uint64_t v22;

  v3 = (uint64_t *)a3;
  v4 = objc_alloc_init(PKPhysicsBody);
  v4->_shapeType = 8;
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v4->_quadTree.__ptr_, v3 + 1);
  v5 = v4;
  v5->_dynamicType = 1;
  v5->_bodyDef.type = 1;
  v6 = operator new();
  edgeRadius = v5->_edgeRadius;
  *(_QWORD *)v6 = &off_24C0E82F0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_DWORD *)(v6 + 8) = 4;
  *(float *)(v6 + 12) = edgeRadius;
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v6 + 16), (uint64_t *)&v4->_quadTree);
  v8 = operator new();
  *(_QWORD *)v8 = 0;
  *(_QWORD *)(v8 + 8) = 0;
  *(_DWORD *)(v8 + 32) = 1065353216;
  *(_QWORD *)(v8 + 40) = 0;
  *(_OWORD *)(v8 + 16) = xmmword_208FD6020;
  value = (unint64_t)v5->_shapes.__end_cap_.__value_;
  end = (uint64_t *)v5->_shapes.__end_;
  if ((unint64_t)end >= value)
  {
    begin = v5->_shapes.__begin_;
    v13 = ((char *)end - (char *)begin) >> 3;
    if ((unint64_t)(v13 + 1) >> 61)
      std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
    v14 = value - (_QWORD)begin;
    v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)&v5->_shapes.__end_cap_, v16);
    else
      v17 = 0;
    v18 = (uint64_t *)&v17[8 * v13];
    v19 = (PKPhysicsShape **)&v17[8 * v16];
    *v18 = v8;
    v11 = (PKPhysicsShape **)(v18 + 1);
    v21 = v5->_shapes.__begin_;
    v20 = v5->_shapes.__end_;
    if (v20 != v21)
    {
      do
      {
        v22 = (uint64_t)*--v20;
        *--v18 = v22;
      }
      while (v20 != v21);
      v20 = v5->_shapes.__begin_;
    }
    v5->_shapes.__begin_ = (PKPhysicsShape **)v18;
    v5->_shapes.__end_ = v11;
    v5->_shapes.__end_cap_.__value_ = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *end = v8;
    v11 = (PKPhysicsShape **)(end + 1);
  }
  v5->_shapes.__end_ = v11;
  (*(v11 - 1))->var0.var0 = (b2Shape *)v6;
  v4->_shapeType = 8;

  -[PKPhysicsBody set_allowSleep:](v5, "set_allowSleep:", 1);
  return v5;
}

+ (id)initWithMarchingCubes:(void *)a3 pixelFrame:(CGRect)a4
{
  CGRect v5;

  v5 = a4;
  PKCGrid::physicsBodyFromMarchingCubes((PKCGrid *)a3, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bodyWithBodies:(id)a3
{
  id v3;
  PKPhysicsBody *v4;

  v3 = a3;
  v4 = -[PKPhysicsBody initWithBodies:]([PKPhysicsBody alloc], "initWithBodies:", v3);

  return v4;
}

+ (id)bodyWithCircleOfRadius:(double)a3
{
  PKPhysicsBody *v4;

  v4 = [PKPhysicsBody alloc];
  return -[PKPhysicsBody initWithCircleOfRadius:center:](v4, "initWithCircleOfRadius:center:", a3, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

+ (id)bodyWithCircleOfRadius:(double)a3 center:(CGPoint)a4
{
  return -[PKPhysicsBody initWithCircleOfRadius:center:]([PKPhysicsBody alloc], "initWithCircleOfRadius:center:", a3, a4.x, a4.y);
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3
{
  double height;
  double width;
  PKPhysicsBody *v5;

  height = a3.height;
  width = a3.width;
  v5 = [PKPhysicsBody alloc];
  return -[PKPhysicsBody initWithRectangleOfSize:center:](v5, "initWithRectangleOfSize:center:", width, height, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 edgeRadius:(double)a4
{
  double height;
  double width;
  PKPhysicsBody *v7;
  double v8;

  height = a3.height;
  width = a3.width;
  v7 = [PKPhysicsBody alloc];
  *(float *)&v8 = a4;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](v7, "initWithRectangleOfSize:center:edgeRadius:", width, height, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v8);
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  return -[PKPhysicsBody initWithRectangleOfSize:center:]([PKPhysicsBody alloc], "initWithRectangleOfSize:center:", a3.width, a3.height, a4.x, a4.y);
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(double)a5
{
  double y;
  double x;
  double height;
  double width;
  PKPhysicsBody *v10;
  double v11;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v10 = [PKPhysicsBody alloc];
  *(float *)&v11 = a5;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](v10, "initWithRectangleOfSize:center:edgeRadius:", width, height, x, y, v11);
}

+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return -[PKPhysicsBody initWithEdgeFromPoint:toPoint:]([PKPhysicsBody alloc], "initWithEdgeFromPoint:toPoint:", a3.x, a3.y, a4.x, a4.y);
}

+ (id)bodyWithPolygonFromPath:(CGPath *)a3
{
  CGFloat width;
  CGFloat height;
  float v7;
  float v8;
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  CGFloat x;
  CGFloat y;
  double MidX;
  uint64_t v18;
  std::__shared_weak_count *v19;
  CGRect v20;

  if (CGPathIsEllipse()
    && (width = v20.size.width,
        height = v20.size.height,
        v7 = v20.size.width,
        v8 = v20.size.height,
        (COERCE_UNSIGNED_INT(v7 - v8) & 0x60000000) == 0))
  {
    x = v20.origin.x;
    y = v20.origin.y;
    MidX = CGRectGetMidX(*(CGRect *)(&width - 2));
    objc_msgSend(a1, "bodyWithCircleOfRadius:center:", (float)(v7 * 0.5), MidX, CGRectGetMidY(v20));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKPathCreateFromSimplifiedCGPath(a3);
    std::shared_ptr<PKPath>::shared_ptr[abi:ne180100]<PKPath,void>(&v18, v9);
    +[PKPhysicsBody bodyWithOutline:offset:](PKPhysicsBody, "bodyWithOutline:offset:", &v18, 0.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  return v10;
}

+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3
{
  return -[PKPhysicsBody initWithEdgeChainFromPath:]([PKPhysicsBody alloc], "initWithEdgeChainFromPath:", a3);
}

+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3
{
  return -[PKPhysicsBody initWithEdgeLoopFromPath:]([PKPhysicsBody alloc], "initWithEdgeLoopFromPath:", a3);
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeWeak((id *)&self->_representedObject, a3);
}

- (NSObject)representedObject
{
  return objc_loadWeakRetained((id *)&self->_representedObject);
}

- (void)setPinned:(BOOL)a3
{
  _BOOL4 v3;
  b2Body *body;

  self->_isPinned = a3;
  v3 = !self->_allowsRotation && !a3;
  self->_bodyDef.fixedRotation = v3;
  body = self->_body;
  if (body)
    b2Body::SetFixedRotation(body, v3);
}

- (BOOL)pinned
{
  return self->_isPinned;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  float v5;
  float v6;
  b2Body *body;
  float v9;
  b2Vec2 v10;

  y = a3.y;
  v5 = a3.x * PKGet_INV_PTM_RATIO();
  v6 = y * PKGet_INV_PTM_RATIO();
  v10.x = v5;
  v10.y = v6;
  if ((LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
  {
    body = self->_body;
    if (body)
    {
      v9 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
      b2Body::SetTransform(body, &v10, v9);
    }
    self->_bodyDef.position = v10;
    -[PKPhysicsBody setResting:](self, "setResting:", 0);
  }
}

- (CGPoint)position
{
  b2Body *body;
  b2Vec2 *p_var0;
  float x;
  float y;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  body = self->_body;
  if (body)
    p_var0 = &body->var8.var0;
  else
    p_var0 = &self->_bodyDef.position;
  x = p_var0->x;
  y = p_var0->y;
  v6 = (float)(x * PKGet_PTM_RATIO());
  v7 = (float)(y * PKGet_PTM_RATIO());
  v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (void)set_allowSleep:(BOOL)a3
{
  b2Body *body;

  body = self->_body;
  if (body)
    b2Body::SetSleepingAllowed(body, a3);
  self->_bodyDef.allowSleep = a3;
}

- (BOOL)_allowSleep
{
  b2Body *body;
  uint64_t v4;

  body = self->_body;
  if (body)
    LOBYTE(v4) = b2Body::IsSleepingAllowed(body);
  else
    return self->_bodyDef.allowSleep;
  return v4;
}

- (void)setRotation:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  b2Body *body;
  float v9;
  b2Vec2 var0;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    v12 = v5;
    v13 = v3;
    v14 = v4;
    body = self->_body;
    if (body)
    {
      var0 = body->var8.var0;
      v9 = a3;
      b2Body::SetTransform(body, &var0, v9);
    }
    else
    {
      v9 = a3;
    }
    self->_bodyDef.angle = v9;
    -[PKPhysicsBody setResting:](self, "setResting:", 0);
  }
}

- (double)rotation
{
  b2Body *body;

  body = self->_body;
  if (body)
    return atan2f(body->var8.var1.var0, body->var8.var1.var1);
  else
    return self->_bodyDef.angle;
}

- (void)setLinearDamping:(double)a3
{
  b2Body *body;
  float v4;

  body = self->_body;
  v4 = a3;
  if (body)
    *((float *)&body->var30 + 1) = v4;
  self->_bodyDef.linearDamping = v4;
}

- (double)linearDamping
{
  b2Body *body;
  float *p_linearDamping;

  body = self->_body;
  if (body)
    p_linearDamping = (float *)&body->var30 + 1;
  else
    p_linearDamping = &self->_bodyDef.linearDamping;
  return *p_linearDamping;
}

- (void)setAngularDamping:(double)a3
{
  b2Body *body;
  float v4;

  body = self->_body;
  v4 = a3;
  if (body)
    *(float *)&body[1].var0 = v4;
  self->_bodyDef.angularDamping = v4;
}

- (double)angularDamping
{
  b2Body *body;
  float *p_var0;

  body = self->_body;
  if (body)
    p_var0 = (float *)&body[1].var0;
  else
    p_var0 = &self->_bodyDef.angularDamping;
  return *p_var0;
}

- (void)applyForce:(CGPoint)a3 atPoint:(CGPoint)a4
{
  b2Body *body;
  double y;
  double x;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  BOOL v12;
  float v13;
  float v14;
  float v15;

  body = self->_body;
  if (body)
  {
    y = a4.y;
    x = a4.x;
    v7 = a3.y;
    v8 = a3.x * PKGet_INV_PTM_RATIO();
    v9 = v7 * PKGet_INV_PTM_RATIO();
    v10 = PKGet_INV_PTM_RATIO();
    v11 = PKGet_INV_PTM_RATIO();
    v12 = (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v9) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v12 && body->var5 == 2)
    {
      v13 = x * v10;
      v14 = y * v11;
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      v15 = *(float *)&body->var16 + v9;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + v8;
      *(float *)&body->var16 = v15;
      *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1)
                                   + (float)((float)((float)(v13 - body->var10.var2.var0.var1) * v9)
                                           - (float)((float)(v14 - body->var10.var2.var0.var2) * v8));
    }
  }
}

- (void)applyForce:(CGPoint)a3
{
  b2Body *body;
  double y;
  float v5;
  float v6;
  BOOL v7;
  float v8;

  body = self->_body;
  if (body)
  {
    y = a3.y;
    v5 = a3.x * PKGet_INV_PTM_RATIO();
    v6 = y * PKGet_INV_PTM_RATIO();
    v7 = (LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v7 && body->var5 == 2)
    {
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      v8 = *(float *)&body->var16 + v6;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + v5;
      *(float *)&body->var16 = v8;
    }
  }
}

- (void)applyTorque:(double)a3
{
  b2Body *body;
  float v4;
  BOOL v5;

  body = self->_body;
  v4 = a3;
  if (body)
    v5 = COERCE_UNSIGNED_INT(fabs(a3)) <= 0x7F7FFFFF;
  else
    v5 = 0;
  if (v5 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0)
      b2Body::SetAwake(body, 1);
    *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1) + v4;
  }
}

- (void)applyImpulse:(CGVector)a3 atPoint:(CGPoint)a4
{
  b2Body *body;
  double y;
  double x;
  double dy;
  float v8;
  float v9;
  float v10;
  float v11;
  BOOL v12;
  float v13;
  float v14;
  float var27;
  float v16;

  body = self->_body;
  if (body)
  {
    y = a4.y;
    x = a4.x;
    dy = a3.dy;
    v8 = a3.dx * PKGet_INV_PTM_RATIO();
    v9 = dy * PKGet_INV_PTM_RATIO();
    v10 = PKGet_INV_PTM_RATIO();
    v11 = PKGet_INV_PTM_RATIO();
    v12 = (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v9) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v12 && body->var5 == 2)
    {
      v13 = x * v10;
      v14 = y * v11;
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      var27 = body->var27;
      v16 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * v8) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * v9) + v16;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(v13 - body->var10.var2.var0.var1) * v9)
                                             - (float)((float)(v14 - body->var10.var2.var0.var2) * v8)));
    }
  }
}

- (void)applyImpulse:(CGVector)a3
{
  b2Body *body;
  double dy;
  float var1;
  float var2;
  float v7;
  float v8;
  BOOL v9;
  float var27;
  float v11;

  body = self->_body;
  if (body)
  {
    dy = a3.dy;
    var1 = body->var10.var2.var0.var1;
    var2 = body->var10.var2.var0.var2;
    v7 = a3.dx * PKGet_INV_PTM_RATIO();
    v8 = dy * PKGet_INV_PTM_RATIO();
    v9 = (LODWORD(v7) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v9 && body->var5 == 2)
    {
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      var27 = body->var27;
      v11 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * v7) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * v8) + v11;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(var1 - body->var10.var2.var0.var1) * v8)
                                             - (float)((float)(var2 - body->var10.var2.var0.var2) * v7)));
    }
  }
}

- (void)applyAngularImpulse:(double)a3
{
  b2Body *body;
  float v4;
  BOOL v5;

  body = self->_body;
  v4 = a3;
  if (body)
    v5 = COERCE_UNSIGNED_INT(fabs(a3)) <= 0x7F7FFFFF;
  else
    v5 = 0;
  if (v5 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0)
      b2Body::SetAwake(body, 1);
    *(float *)&body->var15 = *(float *)&body->var15 + (float)(*(float *)&body->var30 * v4);
  }
}

- (void)applyUnscaledForce:(CGVector)a3 atPoint:(CGPoint)a4
{
  b2Body *body;
  double y;
  double x;
  float dx;
  float dy;
  float v9;
  float v10;
  BOOL v11;
  float v12;
  float v13;
  float v14;

  body = self->_body;
  if (body)
  {
    y = a4.y;
    x = a4.x;
    dx = a3.dx;
    dy = a3.dy;
    v9 = PKGet_INV_PTM_RATIO();
    v10 = PKGet_INV_PTM_RATIO();
    v11 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(dy) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v11 && body->var5 == 2)
    {
      v12 = x * v9;
      v13 = y * v10;
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      v14 = *(float *)&body->var16 + dy;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + dx;
      *(float *)&body->var16 = v14;
      *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1)
                                   + (float)((float)((float)(v12 - body->var10.var2.var0.var1) * dy)
                                           - (float)((float)(v13 - body->var10.var2.var0.var2) * dx));
    }
  }
}

- (void)applyUnscaledForce:(CGVector)a3
{
  b2Body *body;
  float dx;
  float dy;
  BOOL v6;
  float v7;
  BOOL v8;
  float v9;

  body = self->_body;
  dx = a3.dx;
  dy = a3.dy;
  if (body)
    v6 = COERCE_UNSIGNED_INT(fabs(a3.dx)) <= 0x7F7FFFFF;
  else
    v6 = 0;
  v7 = fabs(a3.dy);
  v8 = v6 && SLODWORD(v7) <= 2139095039;
  if (v8 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0)
      b2Body::SetAwake(body, 1);
    v9 = *(float *)&body->var16 + dy;
    *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + dx;
    *(float *)&body->var16 = v9;
  }
}

- (void)applyUnscaledImpulse:(CGVector)a3 atPoint:(CGPoint)a4
{
  b2Body *body;
  double y;
  double x;
  float dx;
  float dy;
  float v9;
  float v10;
  BOOL v11;
  float v12;
  float v13;
  float var27;
  float v15;

  body = self->_body;
  if (body)
  {
    y = a4.y;
    x = a4.x;
    dx = a3.dx;
    dy = a3.dy;
    v9 = PKGet_INV_PTM_RATIO();
    v10 = PKGet_INV_PTM_RATIO();
    v11 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(dy) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v11 && body->var5 == 2)
    {
      v12 = x * v9;
      v13 = y * v10;
      if ((b2Body::IsAwake(body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      var27 = body->var27;
      v15 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * dx) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * dy) + v15;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(v12 - body->var10.var2.var0.var1) * dy)
                                             - (float)((float)(v13 - body->var10.var2.var0.var2) * dx)));
    }
  }
}

- (void)applyUnscaledImpulse:(CGVector)a3
{
  b2Body *body;
  float dx;
  float dy;
  BOOL v6;
  float var1;
  float var2;
  float var27;
  float v10;

  body = self->_body;
  if (body)
  {
    dx = a3.dx;
    dy = a3.dy;
    v6 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && COERCE_UNSIGNED_INT(fabs(a3.dy)) <= 0x7F7FFFFF;
    if (v6 && body->var5 == 2)
    {
      var1 = body->var10.var2.var0.var1;
      var2 = body->var10.var2.var0.var2;
      if ((b2Body::IsAwake(self->_body) & 1) == 0)
        b2Body::SetAwake(body, 1);
      var27 = body->var27;
      v10 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * dx) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * dy) + v10;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(var1 - body->var10.var2.var0.var1) * dy)
                                             - (float)((float)(var2 - body->var10.var2.var0.var2) * dx)));
    }
  }
}

- (BOOL)usesPreciseCollisionDetection
{
  return self->_bodyDef.bullet;
}

- (void)setUsesPreciseCollisionDetection:(BOOL)a3
{
  b2Body *body;

  self->_bodyDef.bullet = a3;
  body = self->_body;
  if (body)
    b2Body::SetBullet(body, a3);
}

- (BOOL)affectedByGravity
{
  return self->_bodyDef._sk_affectedByGravity;
}

- (void)setAffectedByGravity:(BOOL)a3
{
  b2Body *body;

  self->_bodyDef._sk_affectedByGravity = a3;
  body = self->_body;
  if (body)
    body->var0 = a3;
}

- (unsigned)categoryBitMask
{
  return self->_bodyDef._sk_categoryBitMask;
}

- (void)setCategoryBitMask:(unsigned int)a3
{
  b2Body *body;

  self->_bodyDef._sk_categoryBitMask = a3;
  body = self->_body;
  if (body)
    b2Body::SetCategoryBitMask(body, a3);
}

- (unsigned)fieldBitMask
{
  return self->_bodyDef._sk_fieldCategoryBitMask;
}

- (void)setFieldBitMask:(unsigned int)a3
{
  b2Body *body;

  self->_bodyDef._sk_fieldCategoryBitMask = a3;
  body = self->_body;
  if (body)
    body->var1 = a3;
}

- (unsigned)collisionBitMask
{
  return self->_bodyDef._sk_collisionBitMask;
}

- (void)setCollisionBitMask:(unsigned int)a3
{
  b2Body *body;

  self->_bodyDef._sk_collisionBitMask = a3;
  body = self->_body;
  if (body)
    b2Body::SetCollisionBitMask(body, a3);
}

- (unsigned)contactTestBitMask
{
  return self->_bodyDef._sk_intersectionCallbackBitMask;
}

- (void)setContactTestBitMask:(unsigned int)a3
{
  b2Body *body;

  self->_bodyDef._sk_intersectionCallbackBitMask = a3;
  body = self->_body;
  if (body)
    b2Body::SetIntersectionCallbackBitMask(body, a3);
}

- (void)setVelocity:(CGVector)a3
{
  double dy;
  float v5;
  float v6;
  b2Body *body;

  dy = a3.dy;
  v5 = a3.dx * PKGet_INV_PTM_RATIO();
  v6 = dy * PKGet_INV_PTM_RATIO();
  if ((LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
  {
    self->_bodyDef.linearVelocity.x = v5;
    self->_bodyDef.linearVelocity.y = v6;
    body = self->_body;
    if (body)
    {
      if (body->var5)
      {
        if ((float)((float)(v6 * v6) + (float)(v5 * v5)) > 0.0)
          b2Body::SetAwake(body, 1);
        body->var14 = v5;
        *(&body->var14 + 1) = v6;
      }
    }
  }
}

- (CGVector)velocity
{
  b2Body *body;
  b2Vec2 *p_linearVelocity;
  b2Vec2 *p_var14;
  BOOL v5;
  float *p_y;
  float x;
  float v8;
  float v9;
  double v10;
  double v11;
  CGVector result;

  body = self->_body;
  p_linearVelocity = &self->_bodyDef.linearVelocity;
  p_var14 = (b2Vec2 *)&body->var14;
  v5 = body == 0;
  if (body)
    p_y = &body->var14 + 1;
  else
    p_y = &self->_bodyDef.linearVelocity.y;
  if (!v5)
    p_linearVelocity = p_var14;
  x = p_linearVelocity->x;
  v8 = *p_y;
  v9 = x * PKGet_PTM_RATIO();
  v10 = (float)(v8 * PKGet_PTM_RATIO());
  v11 = v9;
  result.dy = v10;
  result.dx = v11;
  return result;
}

- (void)setAngularVelocity:(double)a3
{
  float v3;
  b2Body *body;
  float v5;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v3 = a3;
    self->_bodyDef.angularVelocity = v3;
    body = self->_body;
    if (body)
    {
      v5 = (LODWORD(v3) & 0x7FFFFFFFu) >= 0x7F800000 ? 0.0 : v3;
      if (body->var5)
      {
        if ((float)(v5 * v5) > 0.0)
          b2Body::SetAwake(self->_body, 1);
        *(float *)&body->var15 = v5;
      }
    }
  }
}

- (double)angularVelocity
{
  b2Body *body;
  float *p_var15;

  body = self->_body;
  if (body)
    p_var15 = (float *)&body->var15;
  else
    p_var15 = &self->_bodyDef.angularVelocity;
  return *p_var15;
}

- (void)setAllowsRotation:(BOOL)a3
{
  int v4;
  b2Body *body;

  self->_allowsRotation = a3;
  if (a3)
    v4 = 0;
  else
    v4 = !-[PKPhysicsBody pinned](self, "pinned");
  self->_bodyDef.fixedRotation = v4;
  body = self->_body;
  if (body)
    b2Body::SetFixedRotation(body, v4);
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (BOOL)isResting
{
  b2Body *body;
  uint64_t v4;

  body = self->_body;
  if (body)
    LOBYTE(v4) = b2Body::IsAwake(body) ^ 1;
  else
    return !self->_bodyDef.awake;
  return v4;
}

- (void)setResting:(BOOL)a3
{
  b2Body *body;

  self->_bodyDef.awake = !a3;
  body = self->_body;
  if (body)
    b2Body::SetAwake(body, !a3);
}

- (NSArray)joints
{
  NSMutableArray **p_joints;
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_joints = &self->_joints;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_joints, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *p_joints;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_implicit", (_QWORD)v10) & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (double)mass
{
  __n128 v2;
  PKPhysicsShape **begin;
  double v5;
  PKPhysicsShape *v6;
  b2Fixture *var1;
  b2Shape *var0;
  __n128 v9;
  float v11[4];

  begin = self->_shapes.__begin_;
  if (begin != self->_shapes.__end_)
  {
    v5 = 0.0;
    while (1)
    {
      v6 = *begin;
      var1 = (*begin)->var1;
      if (var1)
        break;
      var0 = v6->var0.var0;
      if (v6->var0.var0)
      {
        -[PKPhysicsBody density](self, "density");
        v9.n128_f32[0] = v9.n128_f64[0];
        (*(void (**)(b2Shape *, float *, __n128))(*(_QWORD *)var0 + 64))(var0, v11, v9);
        goto LABEL_7;
      }
LABEL_8:
      if (++begin == self->_shapes.__end_)
        return v5;
    }
    v2.n128_u32[0] = *((_DWORD *)var1 + 2);
    (*(void (**)(_QWORD, float *, __n128))(**((_QWORD **)var1 + 4) + 64))(*((_QWORD *)var1 + 4), v11, v2);
LABEL_7:
    v2.n128_f64[0] = v11[0];
    v5 = v5 + v11[0];
    goto LABEL_8;
  }
  return 0.0;
}

- (void)setMass:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[PKPhysicsBody mass](self, "mass");
  v6 = v5;
  -[PKPhysicsBody density](self, "density");
  -[PKPhysicsBody setDensity:](self, "setDensity:", v7 / v6 * a3);
}

- (void)setDensity:(double)a3
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  float v5;
  BOOL v6;
  PKPhysicsShape *v7;
  b2Fixture *var1;
  b2Body *body;

  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    v5 = a3;
    v6 = v5 > -INFINITY;
    if (v5 >= INFINITY)
      v6 = 0;
    if (v5 < 0.0)
      v6 = 0;
    do
    {
      v7 = *begin;
      v7->var0.var4 = v5;
      var1 = v7->var1;
      if (var1)
      {
        if (!v6)
          -[PKPhysicsBody setDensity:].cold.1();
        *((float *)var1 + 2) = v5;
      }
      ++begin;
    }
    while (begin != end);
  }
  body = self->_body;
  if (body)
    b2Body::ResetMassData(body);
}

- (double)density
{
  PKPhysicsShape **begin;

  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin)
    return 0.0;
  else
    return (*begin)->var0.var4;
}

- (double)area
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PKPhysicsBody density](self, "density");
  if (v3 == 0.0)
    return 0.0;
  -[PKPhysicsBody mass](self, "mass");
  v5 = v4;
  -[PKPhysicsBody density](self, "density");
  return v5 / v6;
}

- (double)radius
{
  PKPhysicsShape **begin;

  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin)
    return 0.0;
  else
    return *((float *)(*begin)->var0.var0 + 3);
}

- (void)reapplyScale:(double)a3 yScale:(double)a4
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  float v7;
  float v8;
  b2FixtureDef *v9;
  b2Fixture *var1;
  b2Body *body;
  float v12;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    begin = self->_shapes.__begin_;
    end = self->_shapes.__end_;
    if (begin != end)
    {
      v7 = a3;
      v8 = a4;
      do
      {
        v9 = (b2FixtureDef *)*begin;
        var1 = (*begin)->var1;
        if (var1)
        {
          PKPhysicsReapplyScaleOnFixture(v9, var1, v7, v8);
        }
        else
        {
          v9->var5 = v7;
          v9->var6 = v8;
        }
        ++begin;
      }
      while (begin != end);
    }
    body = self->_body;
    if (body)
    {
      v12 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
      b2Body::SetTransform(body, &body->var8.var0, v12);
    }
  }
}

- (void)setRadius:(double)a3
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  float v5;
  uint64_t v6;
  b2Body *body;
  float v8;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    begin = self->_shapes.__begin_;
    end = self->_shapes.__end_;
    if (begin != end)
    {
      v5 = a3;
      do
      {
        v6 = (uint64_t)*begin++;
        *(float *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 32) + 12) = v5;
      }
      while (begin != end);
    }
    body = self->_body;
    v8 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
    b2Body::SetTransform(body, &body->var8.var0, v8);
  }
}

- (void)setRestitution:(double)a3
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  float v5;
  PKPhysicsShape *v6;
  b2Fixture *var1;

  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    v5 = a3;
    do
    {
      v6 = *begin;
      v6->var0.var3 = v5;
      var1 = v6->var1;
      if (var1)
        *((float *)var1 + 11) = v5;
      ++begin;
    }
    while (begin != end);
  }
}

- (double)restitution
{
  PKPhysicsShape **begin;

  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin)
    return 0.0;
  else
    return (*begin)->var0.var3;
}

- (void)setFriction:(double)a3
{
  PKPhysicsShape **begin;
  PKPhysicsShape **end;
  float v5;
  PKPhysicsShape *v6;
  b2Fixture *var1;

  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    v5 = a3;
    do
    {
      v6 = *begin;
      v6->var0.var2 = v5;
      var1 = v6->var1;
      if (var1)
        *((float *)var1 + 10) = v5;
      ++begin;
    }
    while (begin != end);
  }
}

- (double)friction
{
  PKPhysicsShape **begin;

  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin)
    return 0.0;
  else
    return (*begin)->var0.var2;
}

- (void)setCharge:(double)a3
{
  float v3;
  b2Body *body;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v3 = a3;
    self->_bodyDef.charge = v3;
    body = self->_body;
    if (body)
      b2Body::SetCharge(body, v3);
  }
}

- (double)charge
{
  b2Body *body;

  body = self->_body;
  if (body)
    return b2Body::GetCharge(body);
  else
    return self->_bodyDef.charge;
}

- (BOOL)isDynamic
{
  return self->_bodyDef.type == self->_dynamicType;
}

- (void)setDynamic:(BOOL)a3
{
  int dynamicType;
  b2Body *body;

  if (a3)
    dynamicType = self->_dynamicType;
  else
    dynamicType = 0;
  self->_bodyDef.type = dynamicType;
  body = self->_body;
  if (body)
    b2Body::SetType(body, dynamicType);
}

- (id)copy
{
  return -[PKPhysicsBody copyWithZone:](self, "copyWithZone:", MEMORY[0x20BD0B9BC](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPhysicsBody *v4;
  float radius;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  float edgeRadius;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  PKPhysicsShape **begin;
  vector<PKPhysicsShape *, std::allocator<PKPhysicsShape *>> *p_shapes;
  float32x2_t *var0;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  PKPhysicsShape **value;
  _QWORD *end;
  PKPhysicsShape **v31;
  uint64_t v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  PKPhysicsShape **v36;
  _QWORD *v37;
  PKPhysicsShape **v38;
  CGPoint v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  PKPhysicsShape **v50;
  PKPhysicsShape **v51;
  PKPhysicsShape **v52;
  PKPhysicsShape *v53;
  int v54;
  PKPhysicsShape **v55;
  PKPhysicsShape **v56;
  PKPhysicsShape **v57;
  PKPhysicsShape *v58;
  uint64_t p_end_cap;
  CGPoint v61;
  CGPoint v62;
  PKPath *v63;
  std::__shared_weak_count *v64;
  PKPath *v65;
  std::__shared_weak_count *v66;
  PKPath *ptr;
  std::__shared_weak_count *v68;

  v4 = (PKPhysicsBody *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4->_shapeType = self->_shapeType;
  v4->_edgeRadius = self->_edgeRadius;
  v4->_radius = self->_radius;
  v4->_p0 = self->_p0;
  v4->_p1 = self->_p1;
  v4->_size = self->_size;
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v4->_pathPtr.__ptr_, (uint64_t *)&self->_pathPtr);
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v4->_outline.__ptr_, (uint64_t *)&self->_outline);
  -[PKPhysicsBody setDynamic:](v4, "setDynamic:", -[PKPhysicsBody isDynamic](self, "isDynamic"));
  -[PKPhysicsBody setUsesPreciseCollisionDetection:](v4, "setUsesPreciseCollisionDetection:", -[PKPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection"));
  -[PKPhysicsBody setAllowsRotation:](v4, "setAllowsRotation:", -[PKPhysicsBody allowsRotation](self, "allowsRotation"));
  switch(self->_shapeType)
  {
    case 1:
      radius = self->_radius;
      addCircleBody(v4, radius, &self->_p0);
      goto LABEL_70;
    case 2:
      edgeRadius = v4->_edgeRadius;
      addRectangle(v4, &v4->_size, &v4->_p0, edgeRadius);
      goto LABEL_70;
    case 3:
      cntrl = v4->_pathPtr.__cntrl_;
      ptr = v4->_pathPtr.__ptr_;
      v68 = (std::__shared_weak_count *)cntrl;
      if (cntrl)
      {
        v13 = (unint64_t *)((char *)cntrl + 8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      addPolygonFromPath(v4, (uint64_t *)&ptr);
      v9 = v68;
      if (!v68)
        goto LABEL_70;
      p_shared_owners = (unint64_t *)&v68->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      break;
    case 4:
      addEdge(v4, &v4->_p0, &v4->_p1);
      goto LABEL_70;
    case 5:
      v6 = v4->_pathPtr.__cntrl_;
      v65 = v4->_pathPtr.__ptr_;
      v66 = (std::__shared_weak_count *)v6;
      if (v6)
      {
        v7 = (unint64_t *)((char *)v6 + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      addEdgeChain(v4, (uint64_t *)&v65);
      v9 = v66;
      if (!v66)
        goto LABEL_70;
      v10 = (unint64_t *)&v66->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      break;
    case 6:
      v17 = v4->_pathPtr.__cntrl_;
      v63 = v4->_pathPtr.__ptr_;
      v64 = (std::__shared_weak_count *)v17;
      if (v17)
      {
        v18 = (unint64_t *)((char *)v17 + 8);
        do
          v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
      }
      addEdgeLoop(v4, (uint64_t *)&v63);
      v9 = v64;
      if (!v64)
        goto LABEL_70;
      v20 = (unint64_t *)&v64->__shared_owners_;
      do
        v11 = __ldaxr(v20);
      while (__stlxr(v11 - 1, v20));
      break;
    case 7:
      begin = self->_shapes.__begin_;
      if (begin != self->_shapes.__end_)
      {
        p_shapes = &v4->_shapes;
        p_end_cap = (uint64_t)&v4->_shapes.__end_cap_;
        do
        {
          var0 = (float32x2_t *)(*begin)->var0.var0;
          switch(var0[1].i32[0])
          {
            case 0:
              v24 = var0[1].f32[1];
              v62.x = 0.0;
              v62.y = 0.0;
              addCircleBody(v4, v24, &v62);
              break;
            case 1:
              v39 = (CGPoint)vcvtq_f64_f32(var0[2]);
              v61 = (CGPoint)vcvtq_f64_f32(var0[3]);
              v62 = v39;
              addEdge(v4, &v62, &v61);
              break;
            case 2:
              v25 = operator new();
              v26 = v4->_edgeRadius;
              *(_QWORD *)v25 = &off_24C0E81C0;
              *(_OWORD *)(v25 + 16) = 0u;
              *(_OWORD *)(v25 + 32) = 0u;
              *(_OWORD *)(v25 + 48) = 0u;
              *(_DWORD *)(v25 + 8) = 2;
              *(float *)(v25 + 12) = v26;
              *(_QWORD *)(v25 + 64) = 0;
              b2PolygonShape::Set((b2PolygonShape *)v25, *(const b2Vec2 **)&var0[2], (*(_QWORD *)&var0[3] - *(_QWORD *)&var0[2]) >> 3);
              v27 = operator new();
              v28 = v27;
              *(_QWORD *)v27 = 0;
              *(_QWORD *)(v27 + 8) = 0;
              *(_DWORD *)(v27 + 32) = 1065353216;
              *(_QWORD *)(v27 + 40) = 0;
              *(_OWORD *)(v27 + 16) = xmmword_208FD6020;
              end = v4->_shapes.__end_;
              value = v4->_shapes.__end_cap_.__value_;
              if (end >= value)
              {
                v40 = (PKPhysicsShape **)end - p_shapes->__begin_;
                if ((unint64_t)(v40 + 1) >> 61)
                  std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
                v41 = (char *)value - (char *)p_shapes->__begin_;
                v42 = v41 >> 2;
                if (v41 >> 2 <= (unint64_t)(v40 + 1))
                  v42 = v40 + 1;
                if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
                  v43 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v43 = v42;
                if (v43)
                  v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>(p_end_cap, v43);
                else
                  v44 = 0;
                v50 = (PKPhysicsShape **)&v44[8 * v40];
                *v50 = (PKPhysicsShape *)v28;
                v31 = v50 + 1;
                v52 = v4->_shapes.__begin_;
                v51 = v4->_shapes.__end_;
                if (v51 != v52)
                {
                  do
                  {
                    v53 = *--v51;
                    *--v50 = v53;
                  }
                  while (v51 != v52);
                  v51 = p_shapes->__begin_;
                }
                v4->_shapes.__begin_ = v50;
                v4->_shapes.__end_ = v31;
                v4->_shapes.__end_cap_.__value_ = (PKPhysicsShape **)&v44[8 * v43];
                if (v51)
                  operator delete(v51);
              }
              else
              {
                *end = v27;
                v31 = (PKPhysicsShape **)(end + 1);
              }
              v4->_shapes.__end_ = v31;
              (*(v31 - 1))->var0.var0 = (b2Shape *)v25;
              v54 = 3;
              goto LABEL_68;
            case 3:
              v32 = operator new();
              v33 = v4->_edgeRadius;
              *(_QWORD *)v32 = &off_24C0E7ED8;
              *(_QWORD *)(v32 + 24) = 0;
              *(_QWORD *)(v32 + 32) = 0;
              *(_QWORD *)(v32 + 16) = 0;
              *(_DWORD *)(v32 + 8) = 3;
              *(float *)(v32 + 12) = v33;
              *(_WORD *)(v32 + 56) = 0;
              b2ChainShape::CreateChain((void **)v32, *(const b2Vec2 **)&var0[2], (*(_QWORD *)&var0[3] - *(_QWORD *)&var0[2]) >> 3);
              v34 = operator new();
              v35 = v34;
              *(_QWORD *)v34 = 0;
              *(_QWORD *)(v34 + 8) = 0;
              *(_DWORD *)(v34 + 32) = 1065353216;
              *(_QWORD *)(v34 + 40) = 0;
              *(_OWORD *)(v34 + 16) = xmmword_208FD6020;
              v37 = v4->_shapes.__end_;
              v36 = v4->_shapes.__end_cap_.__value_;
              if (v37 >= v36)
              {
                v45 = (PKPhysicsShape **)v37 - p_shapes->__begin_;
                if ((unint64_t)(v45 + 1) >> 61)
                  std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
                v46 = (char *)v36 - (char *)p_shapes->__begin_;
                v47 = v46 >> 2;
                if (v46 >> 2 <= (unint64_t)(v45 + 1))
                  v47 = v45 + 1;
                if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8)
                  v48 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v48 = v47;
                if (v48)
                  v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>(p_end_cap, v48);
                else
                  v49 = 0;
                v55 = (PKPhysicsShape **)&v49[8 * v45];
                *v55 = (PKPhysicsShape *)v35;
                v38 = v55 + 1;
                v57 = v4->_shapes.__begin_;
                v56 = v4->_shapes.__end_;
                if (v56 != v57)
                {
                  do
                  {
                    v58 = *--v56;
                    *--v55 = v58;
                  }
                  while (v56 != v57);
                  v56 = p_shapes->__begin_;
                }
                v4->_shapes.__begin_ = v55;
                v4->_shapes.__end_ = v38;
                v4->_shapes.__end_cap_.__value_ = (PKPhysicsShape **)&v49[8 * v48];
                if (v56)
                  operator delete(v56);
              }
              else
              {
                *v37 = v34;
                v38 = (PKPhysicsShape **)(v37 + 1);
              }
              v4->_shapes.__end_ = v38;
              (*(v38 - 1))->var0.var0 = (b2Shape *)v32;
              v54 = 5;
LABEL_68:
              v4->_shapeType = v54;
              std::shared_ptr<PKPath>::operator=[abi:ne180100](&v4->_pathPtr.__ptr_, (uint64_t *)&self->_pathPtr);
              break;
            case 4:
              NSLog(CFSTR("Need to implement copy for quadtree"));
              break;
            default:
              break;
          }
          ++begin;
        }
        while (begin != self->_shapes.__end_);
      }
      goto LABEL_70;
    case 8:
      NSLog(CFSTR("Need to implement serialization for quadtree."));
      goto LABEL_70;
    default:
      NSLog(CFSTR("ENCODE ERROR"));
      __assert_rtn("-[PKPhysicsBody copyWithZone:]", "PKPhysicsBody.mm", 1593, "false");
  }
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_70:
  -[PKPhysicsBody friction](self, "friction");
  -[PKPhysicsBody setFriction:](v4, "setFriction:");
  -[PKPhysicsBody charge](self, "charge");
  -[PKPhysicsBody setCharge:](v4, "setCharge:");
  -[PKPhysicsBody restitution](self, "restitution");
  -[PKPhysicsBody setRestitution:](v4, "setRestitution:");
  -[PKPhysicsBody density](self, "density");
  -[PKPhysicsBody setDensity:](v4, "setDensity:");
  -[PKPhysicsBody setAffectedByGravity:](v4, "setAffectedByGravity:", -[PKPhysicsBody affectedByGravity](self, "affectedByGravity"));
  -[PKPhysicsBody setCategoryBitMask:](v4, "setCategoryBitMask:", -[PKPhysicsBody categoryBitMask](self, "categoryBitMask"));
  -[PKPhysicsBody setCollisionBitMask:](v4, "setCollisionBitMask:", -[PKPhysicsBody collisionBitMask](self, "collisionBitMask"));
  -[PKPhysicsBody setContactTestBitMask:](v4, "setContactTestBitMask:", -[PKPhysicsBody contactTestBitMask](self, "contactTestBitMask"));
  -[PKPhysicsBody setFieldBitMask:](v4, "setFieldBitMask:", -[PKPhysicsBody fieldBitMask](self, "fieldBitMask"));
  -[PKPhysicsBody setPinned:](v4, "setPinned:", -[PKPhysicsBody pinned](self, "pinned"));
  -[PKPhysicsBody mass](self, "mass");
  -[PKPhysicsBody setMass:](v4, "setMass:");
  -[PKPhysicsBody angularDamping](self, "angularDamping");
  -[PKPhysicsBody setAngularDamping:](v4, "setAngularDamping:");
  -[PKPhysicsBody linearDamping](self, "linearDamping");
  -[PKPhysicsBody setLinearDamping:](v4, "setLinearDamping:");
  -[PKPhysicsBody velocity](self, "velocity");
  -[PKPhysicsBody setVelocity:](v4, "setVelocity:");
  -[PKPhysicsBody angularVelocity](self, "angularVelocity");
  -[PKPhysicsBody setAngularVelocity:](v4, "setAngularVelocity:");
  return v4;
}

- (id)_descriptionClassName
{
  return CFSTR("PKPhysicsBody");
}

- (id)description
{
  void *v3;
  NSObject **p_representedObject;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  p_representedObject = &self->_representedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_representedObject);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)p_representedObject);
  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_representedObject);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_representedObject);
      objc_msgSend(v10, "description");
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v10 = objc_loadWeakRetained((id *)p_representedObject);
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%luxp"), v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }
  v13 = self->_shapeType - 1;
  if (v13 > 7)
    v14 = CFSTR("<Unknown>");
  else
    v14 = off_24C0E8E20[v13];
  v15 = (void *)MEMORY[0x24BDD17C8];
  -[PKPhysicsBody _descriptionClassName](self, "_descriptionClassName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@> type:%@ representedObject:[%@]"), v16, v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)allContactedBodies
{
  void *v3;
  b2Body *body;
  _QWORD *i;
  uint64_t v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  body = self->_body;
  if (body)
  {
    for (i = *(_QWORD **)&body->var24; i; i = (_QWORD *)i[3])
    {
      v6 = i[1];
      if (*i)
        v7 = v6 == 0;
      else
        v7 = 1;
      if (!v7 && (*(_BYTE *)(v6 + 12) & 2) != 0 && *(_QWORD *)(*i + 240))
        objc_msgSend(v3, "addObject:");
    }
  }
  return v3;
}

- (id)postStepBlock
{
  return self->_postStepBlock;
}

- (void)setPostStepBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  PKPhysicsShape **begin;

  objc_storeStrong(&self->_postStepBlock, 0);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_outline);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_quadTree);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_pathPtr);
  objc_storeStrong((id *)&self->_joints, 0);
  objc_destroyWeak((id *)&self->_world);
  begin = self->_shapes.__begin_;
  if (begin)
  {
    self->_shapes.__end_ = begin;
    operator delete(begin);
  }
  objc_destroyWeak((id *)&self->_representedObject);
}

- (id).cxx_construct
{
  b2BodyDef::b2BodyDef(&self->_bodyDef);
  self->_shapes.__begin_ = 0;
  self->_shapes.__end_ = 0;
  self->_shapes.__end_cap_.__value_ = 0;
  self->_outline.__ptr_ = 0;
  self->_outline.__cntrl_ = 0;
  self->_pathPtr = 0u;
  self->_quadTree = 0u;
  return self;
}

- (void)_shapes
{
  return &self->_shapes;
}

- (BOOL)active
{
  b2Body *body;
  uint64_t v4;

  body = self->_body;
  if (body)
    LOBYTE(v4) = b2Body::IsActive(body);
  else
    return self->_bodyDef.active;
  return v4;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  PKPhysicsWorld **p_world;
  id WeakRetained;
  id v7;
  _QWORD v8[5];
  BOOL v9;

  self->_bodyDef.active = a3;
  if (self->_body)
  {
    v3 = a3;
    p_world = &self->_world;
    WeakRetained = objc_loadWeakRetained((id *)&self->_world);

    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)p_world);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __37__PKPhysicsBody_Internal__setActive___block_invoke;
      v8[3] = &unk_24C0E8E00;
      v8[4] = self;
      v9 = v3;
      objc_msgSend(v7, "_runBlockOutsideOfTimeStep:", v8);

    }
    else
    {
      b2Body::SetActive(self->_body, v3);
    }
  }
}

void __37__PKPhysicsBody_Internal__setActive___block_invoke(uint64_t a1)
{
  b2Body::SetActive(*(b2Body **)(*(_QWORD *)(a1 + 32) + 96), *(unsigned __int8 *)(a1 + 40));
}

- (void)set_world:(id)a3
{
  objc_storeWeak((id *)&self->_world, a3);
}

- (id)_world
{
  return objc_loadWeakRetained((id *)&self->_world);
}

- (shared_ptr<QuadTree>)_quadTree
{
  QuadTree **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<QuadTree> result;

  cntrl = self->_quadTree.__cntrl_;
  *v2 = self->_quadTree.__ptr_;
  v2[1] = (QuadTree *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (QuadTree *)self;
  return result;
}

- (id)_joints
{
  return self->_joints;
}

- (void)set_joints:(id)a3
{
  objc_storeStrong((id *)&self->_joints, a3);
}

- (BOOL)_inUse
{
  return self->_inUse;
}

- (void)set_inUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (b2BodyDef)_bodyDef
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->active;
  *(_OWORD *)&retstr->angle = *(_OWORD *)&self->charge;
  *(_OWORD *)&retstr->charge = v3;
  *(_OWORD *)&retstr->active = *(_OWORD *)&self[1]._sk_affectedByGravity;
  v4 = *(_OWORD *)&self->angle;
  *(_OWORD *)&retstr->_sk_affectedByGravity = *(_OWORD *)&self->_sk_intersectionCallbackBitMask;
  *(_OWORD *)&retstr->_sk_intersectionCallbackBitMask = v4;
  return self;
}

- (void)set_bodyDef:(b2BodyDef *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_bodyDef._sk_affectedByGravity = *(_OWORD *)&a3->_sk_affectedByGravity;
  v3 = *(_OWORD *)&a3->_sk_intersectionCallbackBitMask;
  v4 = *(_OWORD *)&a3->angle;
  v5 = *(_OWORD *)&a3->active;
  *(_OWORD *)&self->_bodyDef.charge = *(_OWORD *)&a3->charge;
  *(_OWORD *)&self->_bodyDef.active = v5;
  *(_OWORD *)&self->_bodyDef._sk_intersectionCallbackBitMask = v3;
  *(_OWORD *)&self->_bodyDef.angle = v4;
}

- (b2Body)_body
{
  return self->_body;
}

- (void)set_body:(b2Body *)a3
{
  self->_body = a3;
}

- (void)setDensity:.cold.1()
{
  __assert_rtn("SetDensity", "b2Fixture.h", 244, "b2IsValid(density) && density >= 0.0f");
}

@end

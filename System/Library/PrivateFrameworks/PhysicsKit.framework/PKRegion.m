@implementation PKRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infiniteRegion
{
  void *v2;
  PKRegion *v3;
  void *v4;

  v2 = (void *)sharedInfiniteRegion;
  if (!sharedInfiniteRegion)
  {
    v3 = objc_alloc_init(PKRegion);
    v4 = (void *)sharedInfiniteRegion;
    sharedInfiniteRegion = (uint64_t)v3;

    v2 = (void *)sharedInfiniteRegion;
    *(_DWORD *)(sharedInfiniteRegion + 8) = 1;
  }
  return v2;
}

- (BOOL)isEqualToRegion:(id)a3
{
  PKRegion *v4;
  float32x4_t *v5;
  BOOL v6;
  int16x4_t v7;
  CGPathRef *ptr;
  CGPathRef *v9;
  int16x4_t v10;
  CGPathRef *v11;
  CGPathRef *v12;

  v4 = (PKRegion *)a3;
  v5 = (float32x4_t *)v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    if (self->_shape != v4->_shape || self->_isExclusive != v4->_isExclusive)
      goto LABEL_22;
    v6 = 0;
    v7 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_10[3], *(float32x4_t *)&v4->_anon_10[3])));
    if ((v7.i8[0] & 1) == 0 && (v7.i8[2] & 1) == 0 && (v7.i8[4] & 1) == 0)
    {
      ptr = (CGPathRef *)self->_path.__ptr_;
      v9 = (CGPathRef *)v4->_path.__ptr_;
      if (ptr)
      {
        if (!v9 || !CGPathEqualToPath(*ptr, *v9))
          goto LABEL_22;
      }
      else if (v9)
      {
        goto LABEL_22;
      }
      if (self->_shape2 != v5[3].i32[1])
        goto LABEL_22;
      v6 = 0;
      v10 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_40, v5[4])));
      if ((v10.i8[0] & 1) == 0 && (v10.i8[2] & 1) == 0 && (v10.i8[4] & 1) == 0)
      {
        v11 = (CGPathRef *)self->_path2.__ptr_;
        v12 = (CGPathRef *)v5[5].i64[0];
        if (v11)
        {
          if (v12 && CGPathEqualToPath(*v11, *v12))
            goto LABEL_20;
        }
        else if (!v12)
        {
LABEL_20:
          v6 = self->_regionOp == v5[3].i32[0];
          goto LABEL_23;
        }
LABEL_22:
        v6 = 0;
      }
    }
  }
LABEL_23:

  return v6;
}

- (CGPath)path
{
  int shape;
  CGPath *result;
  const CGPath *v5;
  __int128 v6;
  double v7;
  float v8;
  double v9;
  double v10;
  const CGPath *v11;
  __int128 v12;
  double v13;
  float v14;
  double v15;
  double v16;

  shape = self->_shape;
  switch(shape)
  {
    case 2:
      v5 = *(const CGPath **)self->_path.__ptr_;
      if (v5)
        CGPathRelease(v5);
      v6 = *(_OWORD *)&self->_anon_10[3];
      v7 = (float)-*(float *)&v6;
      LODWORD(v8) = HIDWORD(*(_QWORD *)&self->_anon_10[3]);
      v9 = (float)-v8;
      *(double *)&v6 = (float)(*(float *)&v6 + *(float *)&v6);
      v10 = (float)(v8 + v8);
      result = CGPathCreateWithEllipseInRect(*(CGRect *)(&v6 - 1), 0);
      goto LABEL_11;
    case 3:
      v11 = *(const CGPath **)self->_path.__ptr_;
      if (v11)
        CGPathRelease(v11);
      v12 = *(_OWORD *)&self->_anon_10[3];
      v13 = (float)-*(float *)&v12;
      LODWORD(v14) = HIDWORD(*(_QWORD *)&self->_anon_10[3]);
      v15 = (float)-v14;
      *(double *)&v12 = (float)(*(float *)&v12 + *(float *)&v12);
      v16 = (float)(v14 + v14);
      result = CGPathCreateWithRect(*(CGRect *)(&v12 - 1), 0);
LABEL_11:
      *(_QWORD *)self->_path.__ptr_ = result;
      return result;
    case 4:
      return *(CGPath **)self->_path.__ptr_;
    default:
      return 0;
  }
}

- (BOOL)isInfinite
{
  return self->_shape == 1;
}

- (BOOL)isEmpty
{
  return self->_shape == 0;
}

- (PKRegion)initWithCoder:(id)a3
{
  id v4;
  PKRegion *v5;
  NSString *v6;
  unsigned int v7;
  unsigned int v8;
  __int128 v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGPath *v15;
  _QWORD *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  id v20;
  void *v21;
  int v22;
  NSString *v23;
  unsigned int v24;
  unsigned int v25;
  __int128 v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGPath *v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  __int128 v42;
  objc_super v43;
  _QWORD v44[6];
  _QWORD v45[7];

  v45[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKRegion;
  v5 = -[PKRegion init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_shape = stringToShape(v6);

    v5->_isExclusive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isexclusive"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfx"));
    v40 = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfy"));
    v38 = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfz"));
    *(_QWORD *)&v9 = __PAIR64__(v38, v40);
    *((_QWORD *)&v9 + 1) = v10;
    *(_OWORD *)&v5->_anon_10[3] = v9;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_cgpath")))
    {
      v11 = (void *)MEMORY[0x24BDBCF20];
      v45[0] = objc_opt_class();
      v45[1] = objc_opt_class();
      v45[2] = objc_opt_class();
      v45[3] = objc_opt_class();
      v45[4] = objc_opt_class();
      v45[5] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_cgpath"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = PKCGPathCreateFromArray(v14, 1);
      v16 = operator new(0x20uLL);
      v16[1] = 0;
      v16[2] = 0;
      *v16 = &off_24C0E8B30;
      v16[3] = v15;
      *(_QWORD *)&v42 = v16 + 3;
      *((_QWORD *)&v42 + 1) = v16;
      std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v5->_path, &v42);
      v17 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
      if (*((_QWORD *)&v42 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_op"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("union")) & 1) != 0)
      {
        v22 = 1;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("difference")) & 1) != 0)
      {
        v22 = 2;
      }
      else if (objc_msgSend(v21, "isEqualToString:", CFSTR("intersection")))
      {
        v22 = 3;
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }

    v5->_regionOp = v22;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type2"));
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_shape2 = stringToShape(v23);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfx2"));
    v41 = v24;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfy2"));
    v39 = v25;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_halfz2"));
    *(_QWORD *)&v26 = __PAIR64__(v39, v41);
    *((_QWORD *)&v26 + 1) = v27;
    *(_OWORD *)v5->_anon_40 = v26;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_cgpath2")))
    {
      v28 = (void *)MEMORY[0x24BDBCF20];
      v44[0] = objc_opt_class();
      v44[1] = objc_opt_class();
      v44[2] = objc_opt_class();
      v44[3] = objc_opt_class();
      v44[4] = objc_opt_class();
      v44[5] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("_cgpath"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = PKCGPathCreateFromArray(v31, 1);

      v33 = operator new(0x20uLL);
      v33[1] = 0;
      v33[2] = 0;
      *v33 = &off_24C0E8B30;
      v33[3] = v32;
      *(_QWORD *)&v42 = v33 + 3;
      *((_QWORD *)&v42 + 1) = v33;
      std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v5->_path2, &v42);
      v34 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
      if (*((_QWORD *)&v42 + 1))
      {
        v35 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t shape;
  const __CFString *v6;
  double v7;
  double v8;
  double v9;
  const CGPath **ptr;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t shape2;
  const __CFString *v15;
  double v16;
  double v17;
  double v18;
  const CGPath **v19;
  void *v20;
  id v21;

  v4 = a3;
  shape = self->_shape;
  if (shape > 5)
    v6 = CFSTR("infinite");
  else
    v6 = *(&off_24C0E8F68 + shape);
  v21 = v4;
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_type"));
  objc_msgSend(v21, "encodeBool:forKey:", self->_isExclusive, CFSTR("_isexclusive"));
  LODWORD(v7) = *(_DWORD *)&self->_anon_10[3];
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfx"), v7);
  LODWORD(v8) = *(_DWORD *)&self->_anon_10[7];
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfy"), v8);
  LODWORD(v9) = *(_DWORD *)&self->_anon_10[11];
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfz"), v9);
  ptr = (const CGPath **)self->_path.__ptr_;
  if (ptr)
  {
    PKArrayFromCGPath(*ptr, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("_cgpath"));

  }
  v12 = self->_regionOp - 1;
  if (v12 > 2)
    v13 = CFSTR("no-op");
  else
    v13 = *(&off_24C0E8F50 + v12);
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("_op"));
  shape2 = self->_shape2;
  if (shape2 > 5)
    v15 = CFSTR("infinite");
  else
    v15 = *(&off_24C0E8F68 + shape2);
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("_type2"));
  LODWORD(v16) = *(_DWORD *)self->_anon_40;
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfx2"), v16);
  LODWORD(v17) = *(_DWORD *)&self->_anon_40[4];
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfy2"), v17);
  LODWORD(v18) = *(_DWORD *)&self->_anon_40[8];
  objc_msgSend(v21, "encodeFloat:forKey:", CFSTR("_halfz2"), v18);
  v19 = (const CGPath **)self->_path2.__ptr_;
  if (v19)
  {
    PKArrayFromCGPath(*v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("_cgpath2"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4 + 8) = self->_shape;
  *(_BYTE *)(v4 + 12) = self->_isExclusive;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_anon_10[3];
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v4 + 32), (uint64_t *)&self->_path);
  *(_QWORD *)(v4 + 48) = *(_QWORD *)&self->_regionOp;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)self->_anon_40;
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v4 + 80), (uint64_t *)&self->_path2);
  return (id)v4;
}

- (PKRegion)initWithRadius:(float)a3
{
  PKRegion *v4;
  int32x2_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKRegion;
  v4 = -[PKRegion init](&v7, sel_init);
  if (v4)
  {
    *(float *)v5.i32 = PKGet_INV_PTM_RATIO() * a3;
    v4->_shape = 2;
    *(int32x4_t *)&v4->_anon_10[3] = vdupq_lane_s32(v5, 0);
    v4->_regionOp = 0;
  }
  return v4;
}

- (PKRegion)initWithSize:(CGSize)a3
{
  PKRegion *v3;
  PKRegion *v4;
  float v5;
  float v6;
  unsigned int v7;
  unsigned int v8;
  float v9;
  float64x2_t v10;
  float64x2_t v16;
  float v18;
  double height;
  double width;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)PKRegion;
  v3 = -[PKRegion init](&v21, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_shape = 3;
    v5 = PKGet_INV_PTM_RATIO();
    v6 = PKGet_INV_PTM_RATIO();
    *(float *)&v7 = width * v5;
    *(float *)&v8 = height * v6;
    *(_OWORD *)&v4->_anon_10[3] = __PAIR64__(v8, v7);
    if (PKGetLinkedOnOrAfter())
    {
      v18 = PKGet_INV_PTM_RATIO();
      v9 = PKGet_INV_PTM_RATIO();
      v10.f64[0] = width;
      v10.f64[1] = height;
      __asm { FMOV            V1.2D, #0.5 }
      v16 = vmulq_f64(vmulq_f64(v10, _Q1), vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v9), LODWORD(v18))));
      *(float32x2_t *)&v16.f64[0] = vcvt_f32_f64(v16);
      *(float64x2_t *)&v4->_anon_10[3] = v16;
    }
    v4->_regionOp = 0;
  }
  return v4;
}

- (PKRegion)initWithPath:(CGPath *)a3
{
  PKRegion *v4;
  PKRegion *v5;
  float v6;
  float v7;
  uint64_t v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v14;
  CGAffineTransform v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKRegion;
  v4 = -[PKRegion init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shape = 4;
    memset(&v15, 0, sizeof(v15));
    v6 = PKGet_INV_PTM_RATIO();
    v7 = PKGet_INV_PTM_RATIO();
    CGAffineTransformMakeScale(&v15, v6, v7);
    v8 = MEMORY[0x20BD0B920](a3, &v15);
    v9 = operator new(0x20uLL);
    v9[1] = 0;
    v9[2] = 0;
    *v9 = &off_24C0E8B30;
    v9[3] = v8;
    *(_QWORD *)&v14 = v9 + 3;
    *((_QWORD *)&v14 + 1) = v9;
    std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v5->_path, &v14);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v5->_regionOp = 0;
  }
  return v5;
}

- (id)inverseRegion
{
  _BYTE *v3;

  v3 = (_BYTE *)-[PKRegion copy](self, "copy");
  v3[12] = !self->_isExclusive;
  return v3;
}

- (id)regionByUnionWithRegion:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;

  v4 = a3;
  v5 = -[PKRegion copy](self, "copy");
  *(_DWORD *)(v5 + 52) = *((_DWORD *)v4 + 2);
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v5 + 80), (uint64_t *)v4 + 4);
  if (*((_BYTE *)v4 + 12))
    v6 = 2;
  else
    v6 = 1;
  *(_DWORD *)(v5 + 48) = v6;

  return (id)v5;
}

- (id)regionByDifferenceFromRegion:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;

  v4 = a3;
  v5 = -[PKRegion copy](self, "copy");
  *(_DWORD *)(v5 + 52) = *((_DWORD *)v4 + 2);
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v5 + 80), (uint64_t *)v4 + 4);
  if (*((_BYTE *)v4 + 12))
    v6 = 1;
  else
    v6 = 2;
  *(_DWORD *)(v5 + 48) = v6;

  return (id)v5;
}

- (id)regionByIntersectionWithRegion:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = -[PKRegion copy](self, "copy");
  *(_DWORD *)(v5 + 52) = *((_DWORD *)v4 + 2);
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  std::shared_ptr<PKPath>::operator=[abi:ne180100]((_QWORD *)(v5 + 80), (uint64_t *)v4 + 4);
  *(_DWORD *)(v5 + 48) = 3;

  return (id)v5;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  __int128 v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _BOOL4 v13;
  CGPathRef *ptr;
  int isExclusive;
  BOOL result;
  int regionOp;
  __int128 v19;
  float v20;
  float v21;
  float v22;
  __int128 v24;
  float v25;
  float v26;
  float v27;
  __int128 v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  __int128 v35;
  float v36;
  CGPathRef *v37;
  float v38;
  float v39;
  float v40;
  CGPathRef *v42;
  float v43;
  float v44;
  float v45;
  CGPathRef *v47;
  CGPoint v48;
  CGPoint v49;
  CGPoint v50;

  y = a3.y;
  x = a3.x;
  v6 = 1;
  switch(self->_shape)
  {
    case 0:
      v6 = !self->_isExclusive;
      break;
    case 1:
      break;
    case 2:
      v7 = *(_OWORD *)&self->_anon_10[3];
      LODWORD(v8) = HIDWORD(*(_QWORD *)&self->_anon_10[3]);
      v9 = 0.0;
      v10 = 0.0;
      if (*(float *)&v7 > 0.0)
        v10 = x / *(float *)&v7;
      if (v8 > 0.0)
        v9 = y / v8;
      v6 = (float)((float)(v9 * v9) + (float)(v10 * v10)) <= 1.0;
      break;
    case 3:
      v11 = a3.x;
      v12 = a3.y;
      v13 = fabsf(v12) < COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_anon_10[3]));
      v6 = fabsf(v11) < COERCE_FLOAT(*(_OWORD *)&self->_anon_10[3]) && v13;
      break;
    case 4:
      ptr = (CGPathRef *)self->_path.__ptr_;
      if (!ptr)
        goto LABEL_13;
      v6 = CGPathContainsPoint(*ptr, 0, a3, 1);
      break;
    default:
LABEL_13:
      v6 = 0;
      break;
  }
  isExclusive = self->_isExclusive;
  result = isExclusive != v6;
  regionOp = self->_regionOp;
  if (isExclusive != v6 && regionOp == 2)
  {
    switch(self->_shape2)
    {
      case 1:
        goto LABEL_65;
      case 2:
        v24 = *(_OWORD *)self->_anon_40;
        LODWORD(v25) = HIDWORD(*(_QWORD *)self->_anon_40);
        v26 = 0.0;
        v27 = 0.0;
        if (*(float *)&v24 > 0.0)
          v27 = x / *(float *)&v24;
        if (v25 > 0.0)
          v26 = y / v25;
        return (float)((float)(v26 * v26) + (float)(v27 * v27)) > 1.0;
      case 3:
        v33 = x;
        v34 = fabsf(v33);
        v35 = *(_OWORD *)self->_anon_40;
        if (v34 >= *(float *)&v35)
          goto LABEL_57;
        v36 = y;
        if (fabsf(v36) >= *((float *)&v35 + 1))
          goto LABEL_57;
LABEL_65:
        result = 0;
        break;
      case 4:
        v37 = (CGPathRef *)self->_path2.__ptr_;
        if (!v37)
          goto LABEL_57;
        v48.x = x;
        v48.y = y;
        result = !CGPathContainsPoint(*v37, 0, v48, 1);
        break;
      default:
LABEL_57:
        result = 1;
        break;
    }
  }
  else if (regionOp == 1)
  {
    switch(self->_shape2)
    {
      case 1:
        goto LABEL_57;
      case 2:
        v19 = *(_OWORD *)self->_anon_40;
        LODWORD(v20) = HIDWORD(*(_QWORD *)self->_anon_40);
        v21 = 0.0;
        v22 = 0.0;
        if (*(float *)&v19 > 0.0)
          v22 = x / *(float *)&v19;
        if (v20 > 0.0)
          v21 = y / v20;
        result = (float)((float)(v21 * v21) + (float)(v22 * v22)) <= 1.0 || isExclusive != v6;
        break;
      case 3:
        v38 = x;
        v39 = y;
        v40 = fabsf(v39);
        if (fabsf(v38) < COERCE_FLOAT(*(_OWORD *)self->_anon_40)
          && v40 < COERCE_FLOAT(HIDWORD(*(_QWORD *)self->_anon_40)))
        {
          goto LABEL_57;
        }
        break;
      case 4:
        v42 = (CGPathRef *)self->_path2.__ptr_;
        if (v42)
        {
          v49.x = x;
          v49.y = y;
          result = CGPathContainsPoint(*v42, 0, v49, 1);
          if (isExclusive != v6)
            result = 1;
        }
        break;
      default:
        return result;
    }
  }
  else if (isExclusive != v6 && regionOp == 3)
  {
    result = 1;
    switch(self->_shape2)
    {
      case 0:
        goto LABEL_65;
      case 2:
        v29 = *(_OWORD *)self->_anon_40;
        LODWORD(v30) = HIDWORD(*(_QWORD *)self->_anon_40);
        v31 = 0.0;
        v32 = 0.0;
        if (*(float *)&v29 > 0.0)
          v32 = x / *(float *)&v29;
        if (v30 > 0.0)
          v31 = y / v30;
        result = (float)((float)(v31 * v31) + (float)(v32 * v32)) <= 1.0;
        break;
      case 3:
        v43 = x;
        v44 = y;
        v45 = fabsf(v44);
        if (fabsf(v43) > COERCE_FLOAT(*(_OWORD *)self->_anon_40)
          || v45 > COERCE_FLOAT(HIDWORD(*(_QWORD *)self->_anon_40)))
        {
          goto LABEL_65;
        }
        break;
      case 4:
        v47 = (CGPathRef *)self->_path2.__ptr_;
        if (v47)
        {
          v50.x = x;
          v50.y = y;
          result = CGPathContainsPoint(*v47, 0, v50, 1);
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  float *v13;
  float v14;
  float v15;
  _BOOL4 v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  __int128 v24;
  float v25;
  CGPathRef *ptr;
  float *v28;
  CGPoint v29;

  if ((-[PKRegion isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (a7 >= 1)
    {
      v13 = (float *)(a3 + 1);
      do
      {
        v14 = *(v13 - 1);
        v15 = *v13;
        v16 = 1;
        switch(self->_shape)
        {
          case 1:
            break;
          case 2:
            v17 = *(float *)&self->_anon_10[3];
            v18 = *(float *)&self->_anon_10[7];
            v19 = v14 / v17;
            if (v17 <= 0.0)
              v19 = 0.0;
            v20 = v15 / v18;
            if (v18 <= 0.0)
              v20 = 0.0;
            v21 = *(float *)&self->_anon_10[11];
            if (v21 <= 0.0)
              v22 = 0.0;
            else
              v22 = 0.0 / v21;
            v16 = (float)((float)((float)(v20 * v20) + (float)(v19 * v19)) + (float)(v22 * v22)) <= 1.0;
            break;
          case 3:
            v23 = fabsf(v14);
            v24 = *(_OWORD *)&self->_anon_10[3];
            v25 = fabsf(v15);
            if (v23 >= *(float *)&v24 || v25 >= COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_anon_10[3])))
              goto LABEL_21;
            v16 = *((float *)&v24 + 2) > 0.0;
            break;
          case 4:
            ptr = (CGPathRef *)self->_path.__ptr_;
            if (!ptr)
              goto LABEL_21;
            v29.x = v14;
            v29.y = v15;
            v16 = CGPathContainsPoint(*ptr, 0, v29, 1);
            break;
          default:
LABEL_21:
            v16 = 0;
            break;
        }
        *a5 = self->_isExclusive != v16;
        a5 += a6;
        v13 = (float *)((char *)v13 + a4);
        --a7;
      }
      while (a7);
    }
  }
  else if (a7 >= 1)
  {
    v28 = (float *)(a3 + 1);
    do
    {
      *a5 = -[PKRegion containsPoint:](self, "containsPoint:", *(v28 - 1), *v28);
      a5 += a6;
      v28 = (float *)((char *)v28 + a4);
      --a7;
    }
    while (a7);
  }
}

- (void).cxx_destruct
{
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_path2);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_path);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

@end

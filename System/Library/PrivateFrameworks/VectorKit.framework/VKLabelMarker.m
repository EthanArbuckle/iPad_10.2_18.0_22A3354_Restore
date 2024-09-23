@implementation VKLabelMarker

- (VKLabelMarker)initWithLabelMarkerPtr:(const void *)a3
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  VKLabelMarker *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  LabelMarker *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  objc_super v19;
  LabelMarker *v20;
  std::__shared_weak_count *v21;

  v4 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v20 = *(LabelMarker **)a3;
  v21 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v19.receiver = self;
  v19.super_class = (Class)VKLabelMarker;
  v7 = -[VKMarker initWithFeatureMarkerPtr:markerType:](&v19, sel_initWithFeatureMarkerPtr_markerType_, &v20, 1);
  v8 = v21;
  if (v21)
  {
    v9 = (unint64_t *)&v21->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v7)
  {
    v12 = *(LabelMarker **)a3;
    v11 = *((_QWORD *)a3 + 1);
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    cntrl = (std::__shared_weak_count *)v7->_labelMarker.__cntrl_;
    v7->_labelMarker.__ptr_ = v12;
    v7->_labelMarker.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      v16 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v7;
}

- (const)labelMarkerImpl
{
  return &self->_labelMarker;
}

- (id)text
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 128))(v6);
  if (v7 >= 0)
    v3 = v6;
  else
    v3 = (_QWORD *)v6[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v7) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (id)subtext
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 136))(v6);
  if (v7 >= 0)
    v3 = v6;
  else
    v3 = (_QWORD *)v6[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v7) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (id)locale
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 144))(v6);
  if (v7 >= 0)
    v3 = v6;
  else
    v3 = (_QWORD *)v6[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v7) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (NSArray)dataIconImageKeys
{
  void (***v2)(_QWORD, _QWORD);
  id v3;
  void *v4;
  void (***v5)(_QWORD, _QWORD);
  void (***v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  void (***v9)(_QWORD, _QWORD);
  void (***v10)(_QWORD, _QWORD);
  void (***v11)(_QWORD, _QWORD);
  void (**v12)(_QWORD, _QWORD);
  BOOL v13;
  void (***v15)(_QWORD, _QWORD);
  void (***v16)(_QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;

  (*(void (**)(void (****__return_ptr)(_QWORD, _QWORD)))(*(_QWORD *)self->_labelMarker.__ptr_
                                                                             + 680))(&v15);
  v2 = v15;
  if (v15 == v16)
  {
    v8 = 0;
    if (!v15)
      return (NSArray *)v8;
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v4 = (void *)objc_msgSend(v3, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v16 - v15));
    v5 = v15;
    v6 = v16;
    while (v5 != v6)
    {
      v7 = v5[1];
      if (v7)
        objc_msgSend(v4, "addObject:", v7);

      v5 += 3;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v15;
    if (!v15)
      return (NSArray *)v8;
  }
  v9 = v2;
  if (v16 != v2)
  {
    v10 = v16 - 3;
    v11 = v16 - 3;
    do
    {
      v12 = *v11;
      v11 -= 3;
      (*v12)(v10, v9);
      v13 = v10 == v2;
      v10 = v11;
    }
    while (!v13);
    v9 = v15;
  }
  v16 = v2;
  (*(void (**)(uint64_t, void (***)(_QWORD, _QWORD), uint64_t))(*(_QWORD *)v18 + 40))(v18, v9, v17 - (_QWORD)v9);
  return (NSArray *)v8;
}

- (NSArray)iconImageKeys
{
  shared_ptr<md::LabelMarker> *p_labelMarker;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  VKImageSourceKey *v11;
  float v12;
  double v13;
  double v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  void *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void (*v27)(void);
  uint64_t *v28;
  uint64_t v29;
  id v30;
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  void *v33;
  std::__shared_weak_count *v34;
  void (**v35)(_QWORD);
  std::__shared_weak_count *v36;
  std::__shared_weak_count *v37;
  std::__shared_weak_count_vtbl *v38;
  BOOL v39;
  uint64_t ptr;
  std::__shared_weak_count *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  std::recursive_mutex *v48;
  uint64_t v49;

  p_labelMarker = &self->_labelMarker;
  if (((*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 272))(self->_labelMarker.__ptr_, a2) & 1) != 0|| (*(unsigned int (**)(LabelMarker *))(*(_QWORD *)p_labelMarker->__ptr_ + 280))(p_labelMarker->__ptr_))
  {
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)p_labelMarker->__ptr_ + 688))(&v43);
    cntrl = p_labelMarker->__cntrl_;
    ptr = (uint64_t)p_labelMarker->__ptr_;
    v42 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v4 = (unint64_t *)((char *)cntrl + 8);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v7 = (void *)objc_msgSend(v6, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3));
    v8 = v43;
    v9 = v44;
    if (v43 != v44)
    {
      v10 = (double *)MEMORY[0x1E0C9D538];
      while (1)
      {
        v11 = -[VKImageSourceKey initWithLabelImageKey:]([VKImageSourceKey alloc], "initWithLabelImageKey:", v8);
        if (v11)
          break;
LABEL_8:

        v8 += 24;
        if (v8 == v9)
          goto LABEL_21;
      }
      md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v46, ptr);
      if (v46)
      {
        v12 = *(float *)(ptr + 248);
        v13 = (float)(*(float *)(v8 + 16) / v12);
        v14 = (float)((float)(*(float *)(v46 + 1508) - *(float *)(v8 + 20)) / v12);
        if (!(_BYTE)v49)
          goto LABEL_13;
      }
      else
      {
        v13 = *v10;
        v14 = v10[1];
        if (!(_BYTE)v49)
        {
LABEL_13:
          v15 = v47;
          if (v47)
          {
            p_shared_owners = (unint64_t *)&v47->__shared_owners_;
            do
              v17 = __ldaxr(p_shared_owners);
            while (__stlxr(v17 - 1, p_shared_owners));
            if (!v17)
            {
              ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
              std::__shared_weak_count::__release_weak(v15);
            }
          }
          -[VKImageSourceKey setImageCenter:](v11, "setImageCenter:", v13, v14, ptr);
          objc_msgSend(v7, "addObject:", v11);
          goto LABEL_8;
        }
      }
      std::recursive_mutex::unlock(v48);
      goto LABEL_13;
    }
LABEL_21:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7, ptr);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v19 = (unint64_t *)&v42->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    v21 = v43;
    if (v43)
    {
      v22 = v44;
      v23 = v43;
      if (v44 != v43)
      {
        do
        {
          v24 = *(std::__shared_weak_count **)(v22 - 16);
          if (v24)
          {
            v25 = (unint64_t *)&v24->__shared_owners_;
            do
              v26 = __ldaxr(v25);
            while (__stlxr(v26 - 1, v25));
            if (!v26)
            {
              ((void (*)(std::__shared_weak_count *, uint64_t))v24->__on_zero_shared)(v24, v23);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
          v22 -= 24;
        }
        while (v22 != v21);
      }
      v44 = v21;
      v27 = *(void (**)(void))(*(_QWORD *)v45 + 40);
LABEL_47:
      v27();
    }
  }
  else
  {
    v28 = (uint64_t *)p_labelMarker->__ptr_;
    v46 = 0;
    v47 = 0;
    v29 = v28[15];
    v48 = 0;
    v49 = v29;
    std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v46, v28[12], v28[13], 0xAAAAAAAAAAAAAAABLL * ((v28[13] - v28[12]) >> 3));
    v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v31 = (std::__shared_weak_count *)v46;
    v32 = v47;
    v33 = (void *)objc_msgSend(v30, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v47 - v46) >> 3));
    if (v31 != v32)
    {
      v34 = v31;
      do
      {
        v35 = (void (**)(_QWORD))(id)v34->__shared_owners_;
        if (v35)
          objc_msgSend(v33, "addObject:", v35);

        ++v34;
      }
      while (v34 != v32);
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if (v31 != v32)
      {
        v36 = v32 - 1;
        v37 = v32 - 1;
        do
        {
          v38 = v37->__vftable;
          --v37;
          ((void (*)(std::__shared_weak_count *))v38->~__shared_weak_count)(v36);
          v39 = v36 == v31;
          v36 = v37;
        }
        while (!v39);
      }
      v27 = *(void (**)(void))(*(_QWORD *)v49 + 40);
      goto LABEL_47;
    }
  }
  return (NSArray *)v18;
}

- (NSArray)transitSystems
{
  id v2;
  void *v3;
  uint64_t *v4;
  uint64_t *i;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(uint64_t **__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 544))(&v13);
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "initWithCapacity:", ((char *)v14 - (char *)v13) >> 5);
  v4 = v13;
  for (i = v14; v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0)
      v6 = v4;
    else
      v6 = (uint64_t *)*v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v13)
  {
    v10 = v14;
    v11 = v13;
    if (v14 != v13)
    {
      do
      {
        if (*((char *)v10 - 9) < 0)
          (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)*(v10 - 1) + 40))(*(v10 - 1), *(v10 - 4), *(v10 - 2) & 0x7FFFFFFFFFFFFFFFLL);
        v10 -= 4;
      }
      while (v10 != v9);
      v11 = v13;
    }
    v14 = v9;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v16 + 40))(v16, v11, v15 - (_QWORD)v11);
  }
  return (NSArray *)v8;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D
{
  double v2;
  double v3;
  double v4;
  _QWORD v5[3];
  $1AB5FA073B851C12C2339EC22442E995 result;

  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 584))(v5);
  v2 = *(double *)v5;
  v3 = *(double *)&v5[1];
  v4 = *(double *)&v5[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (float)buildingHeight
{
  float result;

  (*(void (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 600))(self->_labelMarker.__ptr_);
  return result;
}

- (BOOL)hasBuildingFaceAzimuth
{
  return ((*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 608))(self->_labelMarker.__ptr_, a2) & 0xFF00000000) != 0;
}

- (float)buildingFaceAzimuth
{
  uint64_t v2;
  float result;

  v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 608))(self->_labelMarker.__ptr_, a2);
  result = *(float *)&v2;
  if ((v2 & 0xFF00000000) == 0)
    return 0.0;
  return result;
}

- (float)facingDirection
{
  uint64_t v2;
  float result;

  v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 624))(self->_labelMarker.__ptr_, a2);
  result = *(float *)&v2;
  if ((v2 & 0xFF00000000) == 0)
    return 0.0;
  return result;
}

- (BOOL)hasFacingDirection
{
  return ((*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 624))(self->_labelMarker.__ptr_, a2) & 0xFF00000000) != 0;
}

- (Box<double,)_bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  Box<double, 2> result;

  -[VKLabelMarker coordinate](self, "coordinate");
  v4 = v3;
  -[VKLabelMarker coordinate](self, "coordinate");
  v6 = v5;
  v7 = tan(v4 * 0.00872664626 + 0.785398163);
  v8 = log(v7);
  v9 = v6 * 0.00277777778 + 0.5;
  v10 = v8 * 0.159154943 + 0.5;
  v11 = v9;
  v12 = v10;
  result._maximum._e[1] = v12;
  result._maximum._e[0] = v9;
  result._minimum._e[1] = v10;
  result._minimum._e[0] = v11;
  return result;
}

- (id)mapRegion
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  long double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  id v15;
  long double v16;

  -[VKLabelMarker _bounds](self, "_bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6 * 6.28318531;
  v9 = exp(v8 * 6.28318531 + -3.14159265);
  v10 = atan(v9);
  v11 = fmod(v7, 6.28318531);
  v12 = fmod(v11 + 6.28318531, 6.28318531);
  v13 = fmod(v5 * 6.28318531, 6.28318531);
  v14 = fmod(v13 + 6.28318531, 6.28318531);
  v15 = objc_alloc_init(MEMORY[0x1E0D27208]);
  objc_msgSend(v15, "setNorthLat:", v10 * 114.591559 + -90.0);
  v16 = exp(v3 * 6.28318531 + -3.14159265);
  objc_msgSend(v15, "setSouthLat:", (double)(atan(v16) * 114.591559 + -90.0));
  objc_msgSend(v15, "setEastLng:", v14 * 57.2957795 + -180.0);
  objc_msgSend(v15, "setWestLng:", v12 * 57.2957795 + -180.0);
  return v15;
}

- (CGRect)_calloutAnchorRect:(BOOL)a3
{
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v4 = (*(float (**)(LabelMarker *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 560))(self->_labelMarker.__ptr_, a3);
  v5 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
  v7 = (float)-(float)(v6 * v5);
  v9 = (float)((float)(v8 - v4) * v5);
  v11 = (float)((float)(v6 - v10) * v5);
  v12 = (float)(v4 * v5);
  v13 = v7;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)lateralCalloutAnchorRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[VKLabelMarker _calloutAnchorRect:](self, "_calloutAnchorRect:", 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)calloutAnchorRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[VKLabelMarker _calloutAnchorRect:](self, "_calloutAnchorRect:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isSelectable
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 432))(self->_labelMarker.__ptr_);
}

- (BOOL)isSelected
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 440))(self->_labelMarker.__ptr_);
}

- (BOOL)isDragged
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 496))(self->_labelMarker.__ptr_);
}

- (void)setIsDragged:(BOOL)a3
{
  (*(void (**)(LabelMarker *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 504))(self->_labelMarker.__ptr_, a3);
}

- (BOOL)useVKSelectionBalloon
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 528))(self->_labelMarker.__ptr_);
}

- (void)setUseVKSelectionBalloon:(BOOL)a3
{
  (*(void (**)(LabelMarker *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 536))(self->_labelMarker.__ptr_, a3);
}

- (BOOL)isOnRoute
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 264))(self->_labelMarker.__ptr_);
}

- (BOOL)isAlongSelectedTransitLine
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 480))(self->_labelMarker.__ptr_);
}

- (BOOL)isVisible
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 464))(self->_labelMarker.__ptr_);
}

- (BOOL)isTextVisible
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 472))(self->_labelMarker.__ptr_);
}

- (BOOL)isOccluded
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 488))(self->_labelMarker.__ptr_);
}

- (BOOL)isOneWayArrow
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 152))(self->_labelMarker.__ptr_);
}

- (BOOL)isTrafficIncident
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 160))(self->_labelMarker.__ptr_);
}

- (BOOL)isTrafficCamera
{
  return 0;
}

- (BOOL)isRouteEta
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 168))(self->_labelMarker.__ptr_);
}

- (BOOL)isRouteWaypoint
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 184))(self->_labelMarker.__ptr_);
}

- (BOOL)isRouteAnnotation
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 192))(self->_labelMarker.__ptr_);
}

- (BOOL)isVenueButton
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 376))(self->_labelMarker.__ptr_);
}

- (BOOL)isFlyoverTour
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 216))(self->_labelMarker.__ptr_);
}

- (BOOL)isTransit
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 240))(self->_labelMarker.__ptr_);
}

- (BOOL)isTransitLine
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 248))(self->_labelMarker.__ptr_);
}

- (BOOL)isTransitAccessPoint
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 256))(self->_labelMarker.__ptr_);
}

- (BOOL)isTrail
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 288))(self->_labelMarker.__ptr_);
}

- (BOOL)hasBusinessID
{
  return (*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 296))(self->_labelMarker.__ptr_, a2) != 0;
}

- (unint64_t)businessID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 296))(self->_labelMarker.__ptr_);
}

- (unint64_t)clientFeatureID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 312))(self->_labelMarker.__ptr_);
}

- (unint64_t)featureLabelIdentifier
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 208))(self->_labelMarker.__ptr_);
}

- (const)featureIDs
{
  return (const unint64_t *)*((_QWORD *)self->_labelMarker.__ptr_ + 4);
}

- (unint64_t)countFeatureIDs
{
  return (uint64_t)(*((_QWORD *)self->_labelMarker.__ptr_ + 5) - *((_QWORD *)self->_labelMarker.__ptr_ + 4)) >> 3;
}

- (unint64_t)venueID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 40))(self->_labelMarker.__ptr_);
}

- (unint64_t)venueBuildingID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 48))(self->_labelMarker.__ptr_);
}

- (unint64_t)venueLevelID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 56))(self->_labelMarker.__ptr_);
}

- (unint64_t)venueComponentID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 64))(self->_labelMarker.__ptr_);
}

- (signed)venueFloorOrdinal
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 72))(self->_labelMarker.__ptr_);
}

- (signed)venueLookInsideFloorOrdinal
{
  uint64_t var4;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 80))(&var4);
  if ((_BYTE)var4)
    return WORD1(var4);
  else
    return 0;
}

- (BOOL)hasVenueLookInsideFloorOrdinal
{
  _BOOL8 var4;

  (*(void (**)(_BOOL8 *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 80))(&var4);
  return var4;
}

- (unsigned)venueComponentType
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 88))(self->_labelMarker.__ptr_);
}

- (BOOL)positionOfInterest:(id *)a3 zoom:(float *)a4
{
  BOOL result;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;
  uint64_t v7;

  v6 = ($F24F406B2B787EFB06265DBA3D28CBD5)vdupq_n_s64(0xC066800000000000);
  v7 = 0x7FEFFFFFFFFFFFFFLL;
  result = (*(uint64_t (**)(LabelMarker *, $F24F406B2B787EFB06265DBA3D28CBD5 *, float *))(*(_QWORD *)self->_labelMarker.__ptr_
                                                                                                  + 632))(self->_labelMarker.__ptr_, &v6, a4);
  *a3 = v6;
  return result;
}

- (int)featureType
{
  unint64_t v2;

  v2 = *((unsigned __int8 *)self->_labelMarker.__ptr_ + 225);
  if (v2 > 0x1B)
    return 0;
  else
    return dword_1A001A4D0[v2];
}

- (id)incident
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 384))(self->_labelMarker.__ptr_);
}

- (id)trafficCamera
{
  return 0;
}

- (id)routeInfo
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 392))(self->_labelMarker.__ptr_);
}

- (id)waypointInfo
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 400))(self->_labelMarker.__ptr_);
}

- (id)routeAnnotations
{
  (*(void (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 416))(self->_labelMarker.__ptr_, a2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
}

- (id)featureAnnotation
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 424))(self->_labelMarker.__ptr_);
}

- (BOOL)isARWalkingFeature
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 200))(self->_labelMarker.__ptr_);
}

- (id)arWalkingFeature
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 408))(self->_labelMarker.__ptr_);
}

- (id)featureHandles
{
  id v2;
  void *v3;
  unsigned __int8 *v4;
  unsigned __int8 *i;
  VKMarkerFeatureHandle *v6;
  unint64_t v7;
  uint64_t v8;
  VKMarkerFeatureHandle *v9;
  void *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;

  (*(void (**)(unsigned __int8 **__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 552))(&v18);
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "initWithCapacity:", (v19 - v18) >> 6);
  v4 = v18;
  for (i = v19; v4 != i; v4 += 64)
  {
    v6 = [VKMarkerFeatureHandle alloc];
    v7 = *v4;
    if (v7 > 0x1B)
      v8 = 0;
    else
      v8 = dword_1A001A4D0[v7];
    v9 = -[VKMarkerFeatureHandle initWithMarkerHandle:featureType:](v6, "initWithMarkerHandle:featureType:", v4, v8);
    if (v9)
      objc_msgSend(v3, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v18;
  if (v18)
  {
    v12 = v19;
    v13 = v18;
    if (v19 != v18)
    {
      do
      {
        v14 = (std::__shared_weak_count *)*((_QWORD *)v12 - 1);
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldaxr(p_shared_owners);
          while (__stlxr(v16 - 1, p_shared_owners));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *, unsigned __int8 *))v14->__on_zero_shared)(v14, v13);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        v12 -= 64;
      }
      while (v12 != v11);
      v13 = v18;
    }
    v19 = v11;
    (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)v21 + 40))(v21, v13, v20 - (_QWORD)v13);
  }
  return v10;
}

- (NSArray)relatedTexts
{
  LabelMarker *ptr;
  void *v3;
  uint64_t *v4;
  uint64_t *i;
  uint64_t *v6;
  void *v7;
  void *v8;

  ptr = self->_labelMarker.__ptr_;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*((_QWORD *)ptr + 21) - *((_QWORD *)ptr + 20)) >> 5);
  v4 = (uint64_t *)*((_QWORD *)ptr + 20);
  for (i = (uint64_t *)*((_QWORD *)ptr + 21); v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0)
      v6 = v4;
    else
      v6 = (uint64_t *)*v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (NSArray)relatedSubTexts
{
  LabelMarker *ptr;
  void *v3;
  uint64_t *v4;
  uint64_t *i;
  uint64_t *v6;
  void *v7;
  void *v8;

  ptr = self->_labelMarker.__ptr_;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*((_QWORD *)ptr + 25) - *((_QWORD *)ptr + 24)) >> 5);
  v4 = (uint64_t *)*((_QWORD *)ptr + 24);
  for (i = (uint64_t *)*((_QWORD *)ptr + 25); v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0)
      v6 = v4;
    else
      v6 = (uint64_t *)*v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (NSArray)imageKeys
{
  LabelMarker *ptr;
  uint64_t v3;
  id v4;
  void (***v5)(_QWORD);
  void (***v6)(_QWORD);
  void *v7;
  void (***v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void (***v11)(_QWORD);
  void (***v12)(_QWORD);
  void (**v13)(_QWORD);
  BOOL v14;
  void (***v16)(_QWORD);
  void (***v17)(_QWORD);
  uint64_t v18;
  uint64_t v19;

  ptr = self->_labelMarker.__ptr_;
  v16 = 0;
  v17 = 0;
  v3 = *((_QWORD *)ptr + 11);
  v18 = 0;
  v19 = v3;
  std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v16, *((_QWORD *)ptr + 8), *((_QWORD *)ptr + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)ptr + 9) - *((_QWORD *)ptr + 8)) >> 3));
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = v16;
  v6 = v17;
  v7 = (void *)objc_msgSend(v4, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v17 - v16));
  if (v5 != v6)
  {
    v8 = v5;
    do
    {
      v9 = v8[1];
      if (v9)
        objc_msgSend(v7, "addObject:", v9);

      v8 += 3;
    }
    while (v8 != v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v5 == v6)
    {
      v5 = v6;
    }
    else
    {
      v11 = v6 - 3;
      v12 = v6 - 3;
      do
      {
        v13 = *v12;
        v12 -= 3;
        (*v13)(v11);
        v14 = v11 == v5;
        v11 = v12;
      }
      while (!v14);
      v6 = v5;
    }
    (*(void (**)(uint64_t, void (***)(_QWORD), uint64_t))(*(_QWORD *)v19 + 40))(v19, v5, v18 - (_QWORD)v6);
  }
  return (NSArray *)v10;
}

- (NSArray)shields
{
  LabelMarker *ptr;
  uint64_t v3;
  id v4;
  void (***v5)(_QWORD);
  void (***v6)(_QWORD);
  void *v7;
  void (***v8)(_QWORD);
  VKLabelMarkerShield *v9;
  void *v10;
  void (***v11)(_QWORD);
  void (***v12)(_QWORD);
  void (**v13)(_QWORD);
  BOOL v14;
  void (***v16)(_QWORD);
  void (***v17)(_QWORD);
  uint64_t v18;
  uint64_t v19;

  ptr = self->_labelMarker.__ptr_;
  v16 = 0;
  v17 = 0;
  v3 = *((_QWORD *)ptr + 19);
  v18 = 0;
  v19 = v3;
  std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v16, *((_QWORD *)ptr + 16), *((_QWORD *)ptr + 17), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)ptr + 17) - *((_QWORD *)ptr + 16)) >> 3));
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = v16;
  v6 = v17;
  v7 = (void *)objc_msgSend(v4, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v17 - v16));
  if (v5 != v6)
  {
    v8 = v5;
    do
    {
      v9 = -[VKLabelMarkerShield initWithImageKey:]([VKLabelMarkerShield alloc], "initWithImageKey:", v8[1]);
      if (v9)
        objc_msgSend(v7, "addObject:", v9);

      v8 += 3;
    }
    while (v8 != v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v5 == v6)
    {
      v5 = v6;
    }
    else
    {
      v11 = v6 - 3;
      v12 = v6 - 3;
      do
      {
        v13 = *v12;
        v12 -= 3;
        (*v13)(v11);
        v14 = v11 == v5;
        v11 = v12;
      }
      while (!v14);
      v6 = v5;
    }
    (*(void (**)(uint64_t, void (***)(_QWORD), uint64_t))(*(_QWORD *)v19 + 40))(v19, v5, v18 - (_QWORD)v6);
  }
  return (NSArray *)v10;
}

- (void)setLabelPressed:(BOOL)a3
{
  (*(void (**)(LabelMarker *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 512))(self->_labelMarker.__ptr_, a3);
}

- (CGPoint)calloutAnchorPointWithSnapToPixels:(BOOL)a3
{
  double v3;
  double v4;
  CGPoint result;

  (*(void (**)(LabelMarker *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 664))(self->_labelMarker.__ptr_, a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)screenCollisionBounds
{
  float v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  std::recursive_mutex *v21;
  char v22;
  CGRect result;

  md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v19, (uint64_t)self->_labelMarker.__ptr_);
  if (!v19)
  {
    v3 = 0.0;
    if (!v22)
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = *(float *)(v19 + 1508);
  if (v22)
LABEL_3:
    std::recursive_mutex::unlock(v21);
LABEL_4:
  v4 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (*(float (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 568))(self->_labelMarker.__ptr_);
  if (v9 < v7 || v10 < v8)
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v12 = v7;
    v13 = v8;
    v14 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
    v15 = (float)(v7 * v14);
    v16 = (float)((float)(v3 - v10) * v14);
    v17 = (float)((float)(v9 - v12) * v14);
    v18 = (float)((float)(v10 - v13) * v14);
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)screenBounds
{
  float v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  std::recursive_mutex *v21;
  char v22;
  CGRect result;

  md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v19, (uint64_t)self->_labelMarker.__ptr_);
  if (!v19)
  {
    v3 = 0.0;
    if (!v22)
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = *(float *)(v19 + 1508);
  if (v22)
LABEL_3:
    std::recursive_mutex::unlock(v21);
LABEL_4:
  v4 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (*(float (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 576))(self->_labelMarker.__ptr_);
  if (v9 < v7 || v10 < v8)
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v12 = v7;
    v13 = v8;
    v14 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
    v15 = (float)(v7 * v14);
    v16 = (float)((float)(v3 - v10) * v14);
    v17 = (float)((float)(v9 - v12) * v14);
    v18 = (float)((float)(v10 - v13) * v14);
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)isLabelHitAtScreenPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4
{
  CGPoint v5;

  v5 = a3;
  return (*(uint64_t (**)(LabelMarker *, CGPoint *, BOOL))(*(_QWORD *)self->_labelMarker.__ptr_ + 656))(self->_labelMarker.__ptr_, &v5, a4);
}

- (int)selectionType
{
  return (*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 640))(self->_labelMarker.__ptr_, a2) == 1;
}

- (unsigned)pickedLabelBalloonBehavior
{
  int v4;

  if (-[VKLabelMarker useVKSelectionBalloon](self, "useVKSelectionBalloon"))
    return 1;
  v4 = (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 648))(self->_labelMarker.__ptr_);
  if (v4 == 2)
    return 2;
  else
    return v4 == 1;
}

- (unsigned)externalFeatureCategory
{
  unsigned int v2;

  v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 672))(self->_labelMarker.__ptr_, a2);
  if (v2 >= 4)
    LOBYTE(v2) = 0;
  return v2;
}

- (unint64_t)animationID
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 224))(self->_labelMarker.__ptr_);
}

- (int)sortKey
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 232))(self->_labelMarker.__ptr_);
}

- (unint64_t)elementCount
{
  return (*(unsigned int (**)(LabelMarker *, SEL))(*(_QWORD *)self->_labelMarker.__ptr_ + 696))(self->_labelMarker.__ptr_, a2);
}

- (id)debugAnchorPointString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[VKLabelMarker _bounds](self, "_bounds");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<LabelMarker> rect:{%f, %f, %f, %f}"), v2, v4, v3, v5);
}

- (BOOL)isCluster
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 320))(self->_labelMarker.__ptr_);
}

- (BOOL)isLeafCluster
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 328))(self->_labelMarker.__ptr_);
}

- (id)clusterContentBounds
{
  return (id)(*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 336))(self->_labelMarker.__ptr_);
}

- (unint64_t)clusterFeatureCount
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  VKLabelMarker *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = 0;
  v14 = 0;
  if ((v2 & 1) == 0)
  {
    v9 = self;
    self = v9;
    if (v10)
    {
      v11 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v11, "VectorKitLabels", 0x5ED09DD50000000FLL);
      self = v9;
    }
  }
  v15 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, uint64_t *))(*(_QWORD *)self->_labelMarker.__ptr_ + 360))(self->_labelMarker.__ptr_, &v12);
  v4 = v12;
  v3 = v13;
  if (v12)
  {
    if (v13 == v12)
    {
      v7 = v13;
    }
    else
    {
      v5 = v13;
      do
      {
        v6 = *(void **)(v5 - 8);
        v5 -= 8;

      }
      while (v5 != v4);
      v7 = v12;
    }
    v13 = v4;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v15 + 40))(v15, v7, v14 - v7);
  }
  return (v3 - v4) >> 3;
}

- (id)clusterFeatureAnnotations
{
  unsigned __int8 v3;
  id v4;
  void *v5;
  id *v6;
  id *v7;
  id v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  void *v13;
  uint64_t v15;
  id *v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = 0;
  v18 = 0;
  {
    v15 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v15, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v19 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, id **))(*(_QWORD *)self->_labelMarker.__ptr_ + 360))(self->_labelMarker.__ptr_, &v16);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", v17 - v16);
  v6 = v16;
  v7 = v17;
  while (v6 != v7)
  {
    v8 = *v6;
    if (v8)
      objc_msgSend(v5, "addObject:", v8);

    ++v6;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  if (v16)
  {
    v11 = v17;
    v12 = v16;
    if (v17 != v16)
    {
      do
      {
        v13 = *--v11;

      }
      while (v11 != v10);
      v12 = v16;
    }
    v17 = v10;
    (*(void (**)(uint64_t, id *, uint64_t))(*(_QWORD *)v19 + 40))(v19, v12, v18 - (_QWORD)v12);
  }
  return v9;
}

- (id)clusterWaypointInfos
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  {
    v10 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v10, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v14 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, uint64_t *))(*(_QWORD *)self->_labelMarker.__ptr_ + 368))(self->_labelMarker.__ptr_, &v11);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v11)
  {
    v6 = v12;
    v7 = v11;
    if (v12 != v11)
    {
      do
      {
        v8 = *(void **)(v6 - 8);
        v6 -= 8;

      }
      while (v6 != v5);
      v7 = v11;
    }
    v12 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 40))(v14, v7, v13 - v7);
  }
  return v4;
}

- (BOOL)isClusterChild
{
  return (*(uint64_t (**)(LabelMarker *))(*(_QWORD *)self->_labelMarker.__ptr_ + 344))(self->_labelMarker.__ptr_);
}

- (id)parentClusterLabelMarker
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_labelMarker.__ptr_ + 352))(&v7);
  if (v7)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", &v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    if (!v8)
      return v2;
  }
  else
  {
    v2 = 0;
    v3 = v8;
    if (!v8)
      return v2;
  }
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return v2;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_labelMarker.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

+ (VKLabelMarker)markerWithLabelMarker:(const void *)a3
{
  id v4;
  void *v5;
  VKLabelMarker *v6;
  VKLabelMarker *v7;

  if (*(_QWORD *)a3)
  {
    v4 = *(id *)(*(_QWORD *)a3 + 24);
    v5 = v4;
    if (v4)
      v6 = (VKLabelMarker *)v4;
    else
      v6 = -[VKLabelMarker initWithLabelMarkerPtr:]([VKLabelMarker alloc], "initWithLabelMarkerPtr:", a3);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end

@implementation VKCustomFeature

- (BOOL)isGlobalFeature
{
  return self->_isGlobalFeature;
}

- (void)setSortKey:(int)a3
{
  *((_DWORD *)self->_feature.__ptr_ + 21) = a3;
}

- (VKCustomFeature)initWithCoordinate:(id)a3
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, a3.var0, a3.var1, 1.79769313e308);
}

- (void)feature
{
  return &self->_feature;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)isPointFeature
{
  return *((_BYTE *)self->_feature.__ptr_ + 8) == 0;
}

- (void)setStyleAttributes:(id)a3
{
  GEOFeatureStyleAttributes *v4;
  GEOFeatureStyleAttributes *v5;
  GEOFeatureStyleAttributes *v6;
  GEOFeatureStyleAttributes *obj;
  LabelExternalFeature *ptr;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  char v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v4 = (GEOFeatureStyleAttributes *)a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  obj = self->_featureStyleAttributesPtr._obj;
  self->_featureStyleAttributesPtr._obj = v5;

  ptr = self->_feature.__ptr_;
  if (!v5)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  -[GEOFeatureStyleAttributes featureStyleAttributesPtr](v5, "featureStyleAttributesPtr");
  v9 = v19;
  v10 = v20;
  if (!v20)
  {
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  v13 = 0;
LABEL_10:
  v14 = (std::__shared_weak_count *)*((_QWORD *)ptr + 5);
  *((_QWORD *)ptr + 4) = v9;
  *((_QWORD *)ptr + 5) = v10;
  if (!v14)
    goto LABEL_14;
  v15 = (unint64_t *)&v14->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    if ((v13 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_14:
    if ((v13 & 1) != 0)
      goto LABEL_20;
  }
  v17 = (unint64_t *)&v10->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
LABEL_20:

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 7) = &off_1E42B5150;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (id)_initWithCoordinate:(id)a3 isInjected:(BOOL)a4
{
  _BOOL4 v4;
  double var2;
  double var0;
  VKCustomFeature *v7;
  VKCustomFeature *v8;
  VKCustomFeature *v9;
  _QWORD *v10;
  md::LabelExternalPointFeature *v11;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  __double2 v18;
  double v19;
  __double2 v20;
  long double v21;
  long double v22;
  float64x2_t v23;
  float v29;
  double var1;
  objc_super v32;

  v4 = a4;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v32.receiver = self;
  v32.super_class = (Class)VKCustomFeature;
  v7 = -[VKCustomFeature init](&v32, sel_init);
  v8 = v7;
  if (fabs(var1 + 180.0) >= 0.00000001 || fabs(var0 + 180.0) >= 0.00000001)
  {
    if (v7)
    {
      v10 = operator new(0x1D8uLL);
      v10[1] = 0;
      v10[2] = 0;
      *v10 = &off_1E42DD188;
      v11 = md::LabelExternalPointFeature::LabelExternalPointFeature((md::LabelExternalPointFeature *)(v10 + 3));
      cntrl = (std::__shared_weak_count *)v8->_feature.__cntrl_;
      v8->_feature.__ptr_ = (LabelExternalFeature *)v11;
      v8->_feature.__cntrl_ = (__shared_weak_count *)v10;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v14 = __ldaxr(p_shared_owners);
        while (__stlxr(v14 - 1, p_shared_owners));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
      v15 = -[VKCustomFeature pointFeature](v8, "pointFeature");
      v16 = *(_QWORD *)(v15 + 192);
      v17 = fabs(var0);
      if (*(_QWORD *)(v15 + 200) != v16)
      {
        if (v17 <= 85.0511169)
        {
          v21 = tan(var0 * 0.00872664626 + 0.785398163);
          v22 = log(v21);
          v23.f64[0] = var1;
          v23.f64[1] = v22;
          __asm { FMOV            V1.2D, #0.5 }
          *(float64x2_t *)(v16 + 24) = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v23);
          *(_WORD *)(v16 + 45) = 257;
        }
        else
        {
          v18 = __sincos_stret(var0 * 0.0174532925);
          v19 = 6378137.0 / sqrt(v18.__sinval * v18.__sinval * -0.00669437999 + 1.0);
          v20 = __sincos_stret(var1 * 0.0174532925);
          *(double *)v16 = v19 * v18.__cosval * v20.__cosval;
          *(double *)(v16 + 8) = v19 * v18.__cosval * v20.__sinval;
          *(double *)(v16 + 16) = v18.__sinval * 0.99330562 * v19;
          *(_BYTE *)(v16 + 44) = 1;
        }
        if (var2 != 1.79769313e308)
        {
          v29 = var2;
          *(float *)(v16 + 40) = v29;
        }
      }
      *(_BYTE *)(-[VKCustomFeature pointFeature](v8, "pointFeature") + 176) = 2;
      if (v4)
        *((_BYTE *)v8->_feature.__ptr_ + 9) = 1;
      v8->_isGlobalFeature = v17 > 85.0511169;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pointFeature
{
  if (*((_BYTE *)self->_feature.__ptr_ + 8))
    return 0;
  else
    return self->_feature.__ptr_;
}

- (BOOL)isLineFeature
{
  return *((_BYTE *)self->_feature.__ptr_ + 8) == 1;
}

- (void)lineFeature
{
  if (*((_BYTE *)self->_feature.__ptr_ + 8) == 1)
    return self->_feature.__ptr_;
  else
    return 0;
}

- (VKCustomFeature)initWithCoordinate3D:(id)a3
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, a3.var0, a3.var1, a3.var2);
}

- (VKCustomFeature)init
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, -180.0, -180.0, 1.79769313e308);
}

- (id)_initInternalFeatureWithCoordinate:(id)a3
{
  return -[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 0, a3.var0, a3.var1, a3.var2);
}

- (id)initLineWithCoordinates:(id *)a3 count:(unint64_t)a4
{
  VKCustomFeature *v6;
  char *v7;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  _BYTE *v20;
  unint64_t v21;
  void *v22;
  const $1AB5FA073B851C12C2339EC22442E995 *v23;
  double *v24;
  NSString *imageKey;
  VKCustomImageProvider *imageProvider;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VKCustomFeature;
  v6 = -[VKCustomFeature init](&v28, sel_init);
  if (!v6)
    return v6;
  v7 = (char *)operator new(0xE8uLL);
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &off_1E42DCF58;
  *((_WORD *)v7 + 16) = 1;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *((_QWORD *)v7 + 13) = 0x7FFFFFFF437C0000;
  v7[112] = 0;
  *((_QWORD *)v7 + 19) = 0;
  *((_QWORD *)v7 + 20) = 0;
  *((_QWORD *)v7 + 18) = 0;
  *((_QWORD *)v7 + 24) = 0;
  *((_QWORD *)v7 + 15) = 0;
  *((_QWORD *)v7 + 16) = 0;
  v7[136] = 0;
  *((_QWORD *)v7 + 3) = &off_1E42A09D8;
  *((_WORD *)v7 + 100) = 256;
  *((_QWORD *)v7 + 27) = 0;
  *((_QWORD *)v7 + 28) = 0;
  *((_QWORD *)v7 + 26) = 0;
  cntrl = (std::__shared_weak_count *)v6->_feature.__cntrl_;
  v6->_feature.__ptr_ = (LabelExternalFeature *)(v7 + 24);
  v6->_feature.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v11 = -[VKCustomFeature lineFeature](v6, "lineFeature");
  v12 = v11;
  v14 = (_QWORD *)(v11 + 184);
  v13 = *(char **)(v11 + 184);
  v15 = *(_QWORD *)(v11 + 200);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v13) >> 3) < a4)
  {
    if (v13)
    {
      *(_QWORD *)(v11 + 192) = v13;
      operator delete(v13);
      v15 = 0;
      *v14 = 0;
      v14[1] = 0;
      v14[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_33;
    v16 = 0xAAAAAAAAAAAAAAABLL * (v15 >> 3);
    v17 = 2 * v16;
    if (2 * v16 <= a4)
      v17 = a4;
    v18 = v16 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v17;
    if (v18 > 0xAAAAAAAAAAAAAAALL)
LABEL_33:
      abort();
    v13 = (char *)operator new(24 * v18);
    *(_QWORD *)(v12 + 184) = v13;
    *(_QWORD *)(v12 + 192) = v13;
    *(_QWORD *)(v12 + 200) = &v13[24 * v18];
    v19 = 24 * a4;
    memcpy(v13, a3, 24 * a4);
    goto LABEL_26;
  }
  v20 = *(_BYTE **)(v11 + 192);
  v21 = 0xAAAAAAAAAAAAAAABLL * ((v20 - v13) >> 3);
  if (v21 < a4)
  {
    if (v20 != v13)
    {
      memmove(*(void **)(v11 + 184), a3, v20 - v13);
      v13 = *(char **)(v12 + 192);
    }
    v19 = 24 * a4 - 24 * v21;
    if (v21 == a4)
      goto LABEL_26;
    v22 = v13;
    v23 = a3 + v21;
    goto LABEL_25;
  }
  v19 = 24 * a4;
  if (a4)
  {
    v22 = *(void **)(v11 + 184);
    v23 = a3;
LABEL_25:
    memmove(v22, v23, v19);
  }
LABEL_26:
  *(_QWORD *)(v12 + 192) = &v13[v19];
  *(_BYTE *)(v12 + 177) = 1;
  v24 = *(double **)(v12 + 184);
  if (v24 != (double *)&v13[v19])
  {
    while (fabs(*v24) <= 85.0511169)
    {
      v24 += 3;
      if (v24 == (double *)&v13[v19])
        goto LABEL_31;
    }
    *(_BYTE *)(v12 + 177) = 0;
  }
LABEL_31:
  *((_BYTE *)v6->_feature.__ptr_ + 9) = 1;
  imageKey = v6->_imageKey;
  v6->_imageKey = 0;

  imageProvider = v6->_imageProvider;
  v6->_imageProvider = 0;

  v6->_isGlobalFeature = 1;
  return v6;
}

- (void)setImageProvider:(id)a3 withKey:(id)a4
{
  VKCustomImageProvider *v7;
  id v8;
  id *p_imageKey;
  id v10;
  VKCustomImageProvider *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  LabelExternalFeature *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  LabelExternalFeature *ptr;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  _BYTE v27[24];
  _BYTE *v28;
  std::string v29;
  _BYTE v30[24];
  _BYTE *v31;
  std::string v32;
  _QWORD v33[3];
  _QWORD *v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (VKCustomImageProvider *)a3;
  v8 = a4;
  if (self->_imageProvider == v7 && -[NSString isEqualToString:](self->_imageKey, "isEqualToString:", v8))
    goto LABEL_40;
  objc_storeStrong((id *)&self->_imageProvider, a3);
  p_imageKey = (id *)&self->_imageKey;
  objc_storeStrong((id *)&self->_imageKey, a4);
  if (self->_imageProvider)
  {
    v10 = *p_imageKey;
    if (*p_imageKey)
    {
      memset(&v32, 0, sizeof(v32));
      v34 = 0;
      std::string::__assign_external(&v32, (const std::string::value_type *)objc_msgSend(v10, "UTF8String"));
      v11 = self->_imageProvider;
      v12 = *p_imageKey;
      v13 = v33;
      v35[0] = &off_1E42C7B38;
      v35[1] = v11;
      v35[2] = v12;
      v36 = v35;
      std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v35, v33);
      v14 = v36;
      if (v36 == v35)
      {
        v15 = 4;
        v14 = v35;
      }
      else
      {
        if (!v36)
          goto LABEL_17;
        v15 = 5;
      }
      (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_17:
      ptr = self->_feature.__ptr_;
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v29, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
      else
        v29 = v32;
      v21 = v30;
      v22 = (uint64_t)v34;
      if (v34)
      {
        if (v34 == v33)
        {
          v31 = v30;
          (*(void (**)(_QWORD *, _BYTE *))(v33[0] + 24))(v33, v30);
LABEL_25:
          md::LabelExternalFeature::setCustomImageData((uint64_t)ptr, &v29);
          if (v31 == v30)
          {
            v23 = 4;
          }
          else
          {
            if (!v31)
              goto LABEL_30;
            v23 = 5;
            v21 = v31;
          }
          (*(void (**)(_QWORD *))(*v21 + 8 * v23))(v21);
LABEL_30:
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v29.__r_.__value_.__l.__data_);
          if (v34 == v33)
          {
            v24 = 4;
          }
          else
          {
            if (!v34)
              goto LABEL_37;
            v24 = 5;
            v13 = v34;
          }
          (*(void (**)(_QWORD *))(*v13 + 8 * v24))(v13);
LABEL_37:
          if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          {
            v19 = (void *)v32.__r_.__value_.__r.__words[0];
            goto LABEL_39;
          }
          goto LABEL_40;
        }
        v22 = (*(uint64_t (**)(void))(*v34 + 16))();
      }
      v31 = (_BYTE *)v22;
      goto LABEL_25;
    }
  }
  v16 = self->_feature.__ptr_;
  v25[0] = 0;
  v25[1] = 0;
  v26 = 0;
  v28 = 0;
  md::LabelExternalFeature::setCustomImageData((uint64_t)v16, v25);
  v17 = v28;
  if (v28 == v27)
  {
    v18 = 4;
    v17 = v27;
  }
  else
  {
    if (!v28)
      goto LABEL_13;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_13:
  if (SHIBYTE(v26) < 0)
  {
    v19 = (void *)v25[0];
LABEL_39:
    operator delete(v19);
  }
LABEL_40:

}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (id)customImageKey
{
  return self->_imageKey;
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setFeatureID:(unint64_t)a3
{
  *((_QWORD *)self->_feature.__ptr_ + 2) = a3;
}

- (unint64_t)featureID
{
  return *((_QWORD *)self->_feature.__ptr_ + 2);
}

- (void)setClientFeatureID:(unint64_t)a3
{
  *((_QWORD *)self->_feature.__ptr_ + 3) = a3;
}

- (unint64_t)clientFeatureID
{
  return *((_QWORD *)self->_feature.__ptr_ + 3);
}

- (id)styleAttributes
{
  return self->_featureStyleAttributesPtr._obj;
}

- (void)setMinZoom:(float)a3
{
  *((float *)self->_feature.__ptr_ + 18) = a3;
}

- (void)setMaxZoom:(float)a3
{
  *((float *)self->_feature.__ptr_ + 20) = a3;
}

- (void)setTextDisplayMode:(unsigned __int8)a3
{
  unsigned __int8 v3;

  if (a3 >= 4u)
    v3 = 0;
  else
    v3 = a3;
  *((_BYTE *)self->_feature.__ptr_ + 88) = v3;
}

- (void)setText:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  LabelExternalFeature *ptr;
  id v12;
  const char *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = v6;
  v8 = v15;
  if ((unint64_t)objc_msgSend(v15, "length") >= 0xC9)
  {
    v9 = objc_msgSend(v15, "rangeOfComposedCharacterSequenceAtIndex:", 199);
    objc_msgSend(v15, "substringToIndex:", v9 + v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  ptr = self->_feature.__ptr_;
  v12 = objc_retainAutorelease(v8);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = objc_retainAutorelease(v7);
  md::LabelExternalFeature::addTextForZoom((int64x2_t *)ptr, 0, 0, v13, (const char *)objc_msgSend(v14, "UTF8String"));

}

- (BOOL)isInjectedFeature
{
  return *((_BYTE *)self->_feature.__ptr_ + 9) == 1;
}

- (void)setFeatureRegion:(id)a3
{
  id v5;

  v5 = a3;
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    objc_storeStrong((id *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 240), a3);

}

- (void)setBusinessID:(unint64_t)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 184) = a3;
}

- (unint64_t)businessID
{
  unint64_t result;

  result = -[VKCustomFeature pointFeature](self, "pointFeature");
  if (result)
    return *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 184);
  return result;
}

- (void)setVenueID:(unint64_t)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 248) = a3;
}

- (unint64_t)venueID
{
  unint64_t result;

  result = -[VKCustomFeature pointFeature](self, "pointFeature");
  if (result)
    return *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 248);
  return result;
}

- (void)setVenueBuildingID:(unint64_t)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 256) = a3;
}

- (unint64_t)venueBuildingID
{
  unint64_t result;

  result = -[VKCustomFeature pointFeature](self, "pointFeature");
  if (result)
    return *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 256);
  return result;
}

- (void)setVenueLevelID:(unint64_t)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 264) = a3;
}

- (unint64_t)venueLevelID
{
  unint64_t result;

  result = -[VKCustomFeature pointFeature](self, "pointFeature");
  if (result)
    return *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 264);
  return result;
}

- (void)setVenueComponentID:(unint64_t)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 272) = a3;
}

- (unint64_t)venueComponentID
{
  unint64_t result;

  result = -[VKCustomFeature pointFeature](self, "pointFeature");
  if (result)
    return *(_QWORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 272);
  return result;
}

- (void)setVenueFloorOrdinal:(signed __int16)a3
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    *(_WORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 280) = a3;
}

- (signed)venueFloorOrdinal
{
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
    return *(_WORD *)(-[VKCustomFeature pointFeature](self, "pointFeature") + 280);
  else
    return 0;
}

- (void)setAnnotationText:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v7 = v13;
    if ((unint64_t)objc_msgSend(v7, "length") >= 0xC9)
    {
      v8 = objc_msgSend(v7, "rangeOfComposedCharacterSequenceAtIndex:", 199);
      objc_msgSend(v7, "substringToIndex:", v8 + v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    v11 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v12 = objc_retainAutorelease(v7);
    md::LabelExternalFeature::addTextForZoom(v11, 0, 2, (const char *)objc_msgSend(v12, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));

  }
}

- (void)setPlaceholderIconWithSize:(CGSize)a3 anchorPoint:(CGPoint)a4 isRound:(BOOL)a5
{
  double y;
  double x;
  double height;
  double width;
  _QWORD *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v11 = -[VKCustomFeature pointFeature](self, "pointFeature");
    *(float *)&v12 = width;
    *(float *)&v13 = height;
    v17 = __PAIR64__(v13, v12);
    *(float *)&v14 = x;
    *(float *)&v15 = height - y;
    v16 = __PAIR64__(v15, v14);
    md::LabelExternalPointFeature::setPlaceholderIcon(v11, &v17, &v16, a5);
  }
}

- (void)setBuildingHeight:(float)a3
{
  float *v5;

  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v5 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v5[54] = a3;
    *((_BYTE *)v5 + 220) = 1;
  }
}

- (void)setBuildingFaceAzimuth:(float)a3
{
  float *v5;

  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v5 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v5[56] = a3;
    *((_BYTE *)v5 + 228) = 1;
  }
}

- (void)setElevationOffset:(double)a3
{
  float *v5;
  float v6;

  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v5 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v6 = a3;
    v5[58] = v6;
  }
}

- (void)setClusteringMode:(unsigned __int8)a3
{
  int v3;
  _WORD *v5;
  __int16 v6;

  v3 = a3;
  if (-[VKCustomFeature pointFeature](self, "pointFeature"))
  {
    v5 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v6 = (v3 == 1) | 0x100;
    if (!v3)
      v6 = 0;
    v5[119] = v6;
  }
}

- (unsigned)clusteringMode
{
  _BYTE *v3;
  unsigned __int8 v4;

  if (!-[VKCustomFeature pointFeature](self, "pointFeature"))
    return 0;
  v3 = -[VKCustomFeature pointFeature](self, "pointFeature");
  v4 = v3[239];
  if (v4)
  {
    if (v3[238])
      return 1;
    else
      return 2;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  LabelExternalFeature *ptr;
  double v6;
  LabelExternalFeature *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;
  LabelExternalFeature *v13;
  uint64_t v14;
  uint64_t i;
  VKLabelExternalTextElement *v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 *v19;
  unsigned __int8 v20;
  double v21;
  __int128 *v22;
  unsigned __int8 v23;
  __int128 *v24;
  unsigned __int8 v25;
  float v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t j;
  VKLabelExternalIconElement *v31;
  _QWORD *v32;
  id v33;
  double v34[3];

  v4 = a3;
  ptr = self->_feature.__ptr_;
  if (ptr)
  {
    v33 = v4;
    objc_msgSend(v4, "encodeInt32:forKey:", *((unsigned __int8 *)ptr + 8), CFSTR("featureType"));
    v7 = self->_feature.__ptr_;
    v8 = 76;
    if (!*((_BYTE *)v7 + 112))
      v8 = 72;
    LODWORD(v6) = *(_DWORD *)((char *)v7 + v8);
    objc_msgSend(v33, "encodeFloat:forKey:", CFSTR("minZoom"), v6);
    LODWORD(v9) = *((_DWORD *)self->_feature.__ptr_ + 20);
    objc_msgSend(v33, "encodeFloat:forKey:", CFSTR("maxZoom"), v9);
    objc_msgSend(v33, "encodeInt32:forKey:", *((unsigned int *)self->_feature.__ptr_ + 21), CFSTR("sortKey"));
    if (*((unsigned __int8 *)self->_feature.__ptr_ + 88) - 1 < 3)
      v10 = (*((_BYTE *)self->_feature.__ptr_ + 88) - 1) + 1;
    else
      v10 = 0;
    objc_msgSend(v33, "encodeInt32:forKey:", v10, CFSTR("textDisplayMode"));
    objc_msgSend(v33, "encodeInt64:forKey:", *((_QWORD *)self->_feature.__ptr_ + 2), CFSTR("featureId"));
    -[VKCustomFeature styleAttributes](self, "styleAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "encodeObject:forKey:", v11, CFSTR("styleAttributes"));

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_feature.__ptr_;
    v14 = *((_QWORD *)v13 + 6);
    for (i = *((_QWORD *)v13 + 7); v14 != i; v14 += 104)
    {
      v16 = -[VKLabelExternalTextElement initWithTextElement:]([VKLabelExternalTextElement alloc], "initWithTextElement:", v14);
      objc_msgSend(v12, "addObject:", v16);

    }
    objc_msgSend(v33, "encodeObject:forKey:", v12, CFSTR("textElements"));
    v17 = -[VKCustomFeature pointFeature](self, "pointFeature");
    v18 = v17;
    if (v17)
    {
      v19 = (__int128 *)v17[24];
      if ((__int128 *)v17[25] == v19)
      {
        if ((v20 & 1) == 0)
          goto LABEL_34;
        v19 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
      }
      while (1)
      {
        md::LabelPoint::coordinate((md::LabelPoint *)v34, (uint64_t)v19);
        objc_msgSend(v33, "encodeDouble:forKey:", CFSTR("latitude"), v34[0]);
        objc_msgSend(v33, "encodeDouble:forKey:", CFSTR("longitude"), v34[1]);
        v22 = (__int128 *)v18[24];
        if ((__int128 *)v18[25] == v22)
        {
          if ((v23 & 1) != 0)
          {
            v22 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
          }
          else
          {
            v22 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
            {
              qword_1ECE2FD68 = 0;
              md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
              *(_OWORD *)&qword_1ECE2FD58 = 0u;
              dword_1ECE2FD70 = 2139095039;
              word_1ECE2FD74 = 256;
              byte_1ECE2FD76 = 1;
            }
          }
        }
        if (*((float *)v22 + 10) == 3.4028e38)
          break;
        v24 = (__int128 *)v18[24];
        if ((__int128 *)v18[25] == v24)
        {
          if ((v25 & 1) != 0)
          {
            v24 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
          }
          else
          {
            v24 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
            {
              qword_1ECE2FD68 = 0;
              md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
              *(_OWORD *)&qword_1ECE2FD58 = 0u;
              dword_1ECE2FD70 = 2139095039;
              word_1ECE2FD74 = 256;
              byte_1ECE2FD76 = 1;
            }
          }
        }
        v26 = *((float *)v24 + 10);
        if (v26 != 3.4028e38)
        {
          objc_msgSend(v33, "encodeDouble:forKey:", CFSTR("altitude"), v26);
          break;
        }
        std::__throw_bad_optional_access[abi:nn180100]();
        __break(1u);
LABEL_34:
        v19 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
        {
          qword_1ECE2FD68 = 0;
          md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
          *(_OWORD *)&qword_1ECE2FD58 = 0u;
          dword_1ECE2FD70 = 2139095039;
          word_1ECE2FD74 = 256;
          byte_1ECE2FD76 = 1;
        }
      }
      LODWORD(v21) = *((_DWORD *)v18 + 58);
      objc_msgSend(v33, "encodeFloat:forKey:", CFSTR("elevationOffset"), v21);
      if (*((_BYTE *)v18 + 220))
      {
        LODWORD(v27) = *((_DWORD *)v18 + 54);
        objc_msgSend(v33, "encodeFloat:forKey:", CFSTR("buildingHeight"), v27);
      }
      if (*((_BYTE *)v18 + 228))
      {
        LODWORD(v27) = *((_DWORD *)v18 + 56);
        objc_msgSend(v33, "encodeFloat:forKey:", CFSTR("buildingFaceAzimuth"), v27);
      }
      objc_msgSend(v33, "encodeInt64:forKey:", v18[23], CFSTR("businessId"));
      objc_msgSend(v33, "encodeInt64:forKey:", v18[31], CFSTR("venueId"));
      objc_msgSend(v33, "encodeInt64:forKey:", v18[33], CFSTR("venueLevelId"));
      objc_msgSend(v33, "encodeInt64:forKey:", v18[34], CFSTR("venueComponentId"));
      objc_msgSend(v33, "encodeInt64:forKey:", *((__int16 *)v18 + 140), CFSTR("venueFloorOrdinal"));
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = v18[44];
      for (j = v18[45]; v29 != j; v29 += 20)
      {
        v31 = -[VKLabelExternalIconElement initWithIconElement:]([VKLabelExternalIconElement alloc], "initWithIconElement:", v29);
        objc_msgSend(v28, "addObject:", v31);

      }
      objc_msgSend(v33, "encodeObject:forKey:", v28, CFSTR("iconElements"));

    }
    v32 = -[VKCustomFeature lineFeature](self, "lineFeature");
    if (v32)
      objc_msgSend(v33, "encodeBytes:length:forKey:", v32[23], v32[24] - v32[23], CFSTR("coordinates"));

    v4 = v33;
  }

}

- (VKCustomFeature)initWithCoder:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  VKCustomFeature *v13;
  VKCustomFeature *v14;
  _QWORD *v15;
  float v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  char v36;
  char v37;
  const char *v38;
  int v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("featureType"));
  if (v5 == 1)
  {
    v49 = 0;
    v12 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("coordinates"), &v49);
    v13 = -[VKCustomFeature initLineWithCoordinates:count:](self, "initLineWithCoordinates:count:", v12, v49 / 0x18);
  }
  else
  {
    if (v5)
    {
      v14 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v9 = v8;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("altitude")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
      v11 = v10;
    }
    else
    {
      v11 = 1.79769313e308;
    }
    v13 = -[VKCustomFeature initWithCoordinate3D:](self, "initWithCoordinate3D:", v7, v9, v11);
    v15 = -[VKCustomFeature pointFeature](v13, "pointFeature");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("elevationOffset"));
    -[VKCustomFeature setElevationOffset:](v13, "setElevationOffset:", v16);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("buildingHeight")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("buildingHeight"));
      -[VKCustomFeature setBuildingHeight:](v13, "setBuildingHeight:");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("buildingFaceAzimuth")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("buildingFaceAzimuth"));
      -[VKCustomFeature setBuildingFaceAzimuth:](v13, "setBuildingFaceAzimuth:");
    }
    -[VKCustomFeature setBusinessID:](v13, "setBusinessID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("businessId")));
    -[VKCustomFeature setVenueID:](v13, "setVenueID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("venueId")));
    -[VKCustomFeature setVenueLevelID:](v13, "setVenueLevelID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("venueLevelId")));
    -[VKCustomFeature setVenueComponentID:](v13, "setVenueComponentID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("venueComponentId")));
    -[VKCustomFeature setVenueFloorOrdinal:](v13, "setVenueFloorOrdinal:", (__int16)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("venueFloorOrdinal")));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("iconElements"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v21);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "element");
          md::LabelExternalPointFeature::setPlaceholderIcon(v15, (_QWORD *)v25, (_QWORD *)(v25 + 8), *(_BYTE *)(v25 + 16));
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v22);
    }

  }
  -[VKCustomFeature setFeatureID:](v13, "setFeatureID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("featureId")));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minZoom"));
  -[VKCustomFeature setMinZoom:](v13, "setMinZoom:");
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxZoom"));
  -[VKCustomFeature setMaxZoom:](v13, "setMaxZoom:");
  -[VKCustomFeature setSortKey:](v13, "setSortKey:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sortKey")));
  -[VKCustomFeature setTextDisplayMode:](v13, "setTextDisplayMode:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("textDisplayMode")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("styleAttributes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCustomFeature setStyleAttributes:](v13, "setStyleAttributes:", v26);
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("textElements"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v31);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "element");
        v36 = *(_BYTE *)v35;
        v37 = *(_BYTE *)(v35 + 1);
        if (*(char *)(v35 + 31) >= 0)
          v38 = (const char *)(v35 + 8);
        else
          v38 = *(const char **)(v35 + 8);
        v39 = *(char *)(v35 + 55);
        v42 = *(const char **)(v35 + 32);
        v40 = (const char *)(v35 + 32);
        v41 = v42;
        if (v39 >= 0)
          v43 = v40;
        else
          v43 = v41;
        md::LabelExternalFeature::addTextForZoom((int64x2_t *)v13->_feature.__ptr_, v36, v37, v38, v43);
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v32);
  }

  self = v13;
  v14 = self;
LABEL_34:

  return v14;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  self->_featureStyleAttributesPtr._vptr$_retain_ptr = (void **)&off_1E42B5150;

  objc_storeStrong((id *)&self->_imageKey, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  cntrl = self->_feature.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (uint64_t)setImageProvider:withKey:
{
  LODWORD(a6) = *a3;
  LODWORD(a4) = *a2;
  LODWORD(a5) = a2[1];
  return objc_msgSend(*(id *)(a1 + 8), "imageForCustomImageKey:suggestedSize:contentScale:", *(_QWORD *)(a1 + 16), (double)*(unint64_t *)&a4, (double)*(unint64_t *)&a5, a6);
}

- (void)setImageProvider:withKey:
{

  operator delete(a1);
}

- (_QWORD)setImageProvider:withKey:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = &off_1E42C7B38;
  v2[1] = *(id *)(a1 + 8);
  v2[2] = *(id *)(a1 + 16);
  return v2;
}

- (id)setImageProvider:withKey:
{
  id result;

  *a2 = &off_1E42C7B38;
  a2[1] = *(id *)(a1 + 8);
  result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

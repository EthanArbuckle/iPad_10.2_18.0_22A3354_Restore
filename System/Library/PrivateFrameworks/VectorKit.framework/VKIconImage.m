@implementation VKIconImage

- (id)init:(shared_ptr<grl::IconImage>)a3
{
  IconImage *ptr;
  VKIconImage *v4;
  VKIconImage *v5;
  IconImage *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  objc_super v14;

  ptr = a3.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)VKIconImage;
  v4 = -[VKIconImage init](&v14, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v6 = *(IconImage **)ptr;
    if (*(_QWORD *)ptr)
    {
      v7 = *((_QWORD *)ptr + 1);
      if (v7)
      {
        v8 = (unint64_t *)(v7 + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      cntrl = (std::__shared_weak_count *)v4->_iconImage.__cntrl_;
      v4->_iconImage.__ptr_ = v6;
      v4->_iconImage.__cntrl_ = (__shared_weak_count *)v7;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
  }
  return v5;
}

- (CGImage)image
{
  IconImage *ptr;
  CGImage *v3;
  uint64_t (**v5)();
  CFTypeRef cf;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  grl::IconImage::image((grl::IconImage *)ptr, &v5);
  v3 = (CGImage *)cf;
  v5 = &off_1E42B4870;
  if (cf)
    CFRelease(cf);
  return v3;
}

- (CGSize)imageSize
{
  IconImage *ptr;
  double v4;
  double v5;
  double v6;
  CGSize result;

  ptr = self->_iconImage.__ptr_;
  if (ptr)
  {
    v4 = *(float *)grl::IconMetrics::size((grl::IconMetrics *)((char *)ptr + 24));
    v5 = *(float *)(grl::IconMetrics::size((grl::IconMetrics *)((char *)self->_iconImage.__ptr_ + 24)) + 4);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGColor)fillColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_fillColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 153))
    return 0;
  v9 = *(_DWORD *)((char *)ptr + 154);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_fillColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_fillColor._obj = v7;
  return result;
}

- (CGColor)haloColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_haloColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 163))
    return 0;
  v9 = *((_DWORD *)ptr + 41);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_haloColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_haloColor._obj = v7;
  return result;
}

- (CGColor)glyphColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_glyphColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 158))
    return 0;
  v9 = *(_DWORD *)((char *)ptr + 159);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_glyphColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_glyphColor._obj = v7;
  return result;
}

- (CGColor)calloutFillColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_calloutFillColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 138))
    return 0;
  v9 = *(_DWORD *)((char *)ptr + 139);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutFillColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_calloutFillColor._obj = v7;
  return result;
}

- (CGColor)calloutHaloColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_calloutHaloColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 143))
    return 0;
  v9 = *((_DWORD *)ptr + 36);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutHaloColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_calloutHaloColor._obj = v7;
  return result;
}

- (CGColor)calloutTextColor
{
  IconImage *ptr;
  CGColor *result;
  CGColor *obj;
  uint64_t v6;
  CGColor *v7;
  char v8;
  __int32 v9;

  ptr = self->_iconImage.__ptr_;
  if (!ptr)
    return 0;
  result = self->_calloutTextColor._obj;
  if (result)
    return result;
  if (!*((_BYTE *)ptr + 148))
    return 0;
  v9 = *(_DWORD *)((char *)ptr + 149);
  v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutTextColor._obj;
  if (obj)
    CFRelease(obj);
  result = v7;
  self->_calloutTextColor._obj = v7;
  return result;
}

- (unsigned)calloutShape
{
  IconImage *ptr;
  unint64_t v3;

  ptr = self->_iconImage.__ptr_;
  if (ptr && *((_BYTE *)ptr + 183) && (v3 = *((unsigned __int8 *)ptr + 184), v3 <= 7))
    return dword_1A001A448[v3];
  else
    return 0;
}

- (BOOL)isBalloonShape
{
  IconImage *ptr;

  ptr = self->_iconImage.__ptr_;
  return ptr && *((_BYTE *)ptr + 183) && *((_BYTE *)ptr + 184) == 3;
}

- (float)opacity
{
  IconImage *ptr;

  ptr = self->_iconImage.__ptr_;
  if (ptr)
    return *((float *)ptr + 48);
  else
    return 1.0;
}

- (float)contentScale
{
  IconImage *ptr;

  ptr = self->_iconImage.__ptr_;
  if (ptr)
    return *((float *)ptr + 47);
  else
    return 1.0;
}

- (void).cxx_destruct
{
  CGColor *obj;
  CGColor *v4;
  CGColor *v5;
  CGColor *v6;
  CGColor *v7;
  CGColor *v8;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;

  self->_calloutTextColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  obj = self->_calloutTextColor._obj;
  if (obj)
    CFRelease(obj);
  self->_calloutHaloColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  v4 = self->_calloutHaloColor._obj;
  if (v4)
    CFRelease(v4);
  self->_calloutFillColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  v5 = self->_calloutFillColor._obj;
  if (v5)
    CFRelease(v5);
  self->_glyphColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  v6 = self->_glyphColor._obj;
  if (v6)
    CFRelease(v6);
  self->_haloColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  v7 = self->_haloColor._obj;
  if (v7)
    CFRelease(v7);
  self->_fillColor._vptr$_retain_ptr = (void **)&off_1E42B4850;
  v8 = self->_fillColor._obj;
  if (v8)
    CFRelease(v8);
  cntrl = self->_iconImage.__cntrl_;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = &off_1E42B4850;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 6) = &off_1E42B4850;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = &off_1E42B4850;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 12) = &off_1E42B4850;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 15) = &off_1E42B4850;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 18) = &off_1E42B4850;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
